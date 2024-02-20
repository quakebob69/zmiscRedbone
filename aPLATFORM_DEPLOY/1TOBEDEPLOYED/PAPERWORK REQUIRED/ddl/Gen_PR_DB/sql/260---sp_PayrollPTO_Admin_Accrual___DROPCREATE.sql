/****** Object:  StoredProcedure [payroll].[sp_PayrollPTO_Admin_Accrual]    Script Date: 2/14/2024 10:10:20 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_Admin_Accrual]
GO

/****** Object:  StoredProcedure [payroll].[sp_PayrollPTO_Admin_Accrual]    Script Date: 2/14/2024 10:10:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [payroll].[sp_PayrollPTO_Admin_Accrual]
(

@PayPeriodEndDate Date
,@LastUpdateBy Int

-- exec sp_Payroll_Admin_PTO_Accrual '09/30/2023', 6

)
AS


SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

DROP TABLE IF EXISTS #HIREDATE
DROP TABLE IF EXISTS #YEARSOFSERVICE
DROP TABLE IF EXISTS #WEEKLYVALUE
DROP TABLE IF EXISTS #WEEKLYTOTAL
DROP TABLE IF EXISTS #HOURS


DELETE FROM main.PersonPTO 
WHERE len(cast(notes as varchar))>17
AND 
(
substring(cast(notes as varchar(256)), len(cast(notes as varchar(256)))-17,20)
='ADMINPPE' + CAST(year(@PayPeriodEndDate) as VARCHAR) + '-' + right('0' + CAST(month(@PayPeriodEndDate) AS VARCHAR),2) + '-' +  right('0' + CAST(day(@PayPeriodEndDate) AS VARCHAR),2)
)

/*SELECT THE MOST RECENT HIRE/REHIRE DATE, WHICH WILL BE TREATED AS HIRE DATE FOR PURPOSES OF PTO CALC*/
SELECT DISTINCT 
	P.PersonId	
	,HireDate = MAX(CASE WHEN sh4.PersonHiringStatusTypeId = 4 THEN cast(sh4.StatusChangeDate as date) ELSE (CASE WHEN sh.PersonHiringStatusTypeId = 1 THEN cast(sh.StatusChangeDate as date) ELSE NULL END) END)
--	,YearsOfService = DATEDIFF(YEAR,CASE WHEN sh4.PersonHiringStatusTypeId = 4 THEN cast(sh4.StatusChangeDate as date) ELSE (CASE WHEN sh.PersonHiringStatusTypeId = 1 THEN cast(sh.StatusChangeDate as date) ELSE NULL END) END,getdate())
	,FullName = FirstName + ' ' + LastName
	,ptgm.PersonPTOGroupId

INTO #HIREDATE

	FROM main.person p
	left join main.PersonNote pn on pn.PersonId = p.PersonId
	left join main.PersonHiringStatusHistory sh on sh.PersonId = p.PersonId and sh.PersonHiringStatusTypeId = 1 --Hired
	left join main.PersonHiringStatusHistory sh1 on sh1.PersonId = p.PersonId and sh1.PersonHiringStatusTypeId = 2 --Terminated
	left join main.PersonHiringStatusHistory sh4 on sh4.PersonId = p.PersonId and sh4.PersonHiringStatusTypeId = 4 --Rehired
	right join main.PersonTypeMapping ptm on ptm.PersonId = p.PersonId
	left join main.PersonPTOGroupMapping ptgm on ptgm.PersonId = p.PersonId

WHERE p.IsActive = 1
	and sh.StatusChangeDate is not null
--	and ptm.PersonTypeId in (1,2)

GROUP BY 
	p.PersonId, FirstName + ' ' + LastName, ptgm.PersonPTOGroupId

	--select * from #HIREDATE order by FullName

/*Retrieve info from time tables*/
SELECT 
	PersonId
	,Quantity = sum(DATEDIFF(second,isnull(clockinadj,clockin),isnull(clockoutadj,clockout))/3600.0)

INTO #HOURS
FROM [RedBone].[main].[TimeClockEntry]
WHERE isnull(clockinadj,clockin) between dateadd(DD,-6,@PayPeriodEndDate) and @PayPeriodEndDate
GROUP BY PersonId

--select * from #HOURS

/*Calculate years of service, starting at 1 year*/
SELECT * 

,YearsOfService = (YEAR(getdate()) - YEAR(HireDate)  
       - CASE WHEN MONTH(getdate()) < MONTH(HireDate) 
               OR (DAY(getdate()) < DAY(HireDate) AND MONTH(getdate()) = MONTH(HireDate) )
            THEN
                1
            ELSE
                0
            END) + 1 

INTO #YEARSOFSERVICE
FROM #HIREDATE HD

order by FullName

--select * from #YEARSOFSERVICE
			
/*Calculate Person PTO Weekly Unit of Accrual based on YOS*/
SELECT 
	yos.PersonId
	, pt.PersonPTOName
	, pt.PersonPTOQty
	, pt.PersonPTOTypeId 

INTO #WEEKLYVALUE
FROM #YEARSOFSERVICE yos
JOIN main.PersonPTOType pt on pt.PersonPTOGroupTypeId = yos.PersonPTOGroupId and yos.YearsOfService between pt.LowerPTO and pt.UpperPTO


/*calculate PayID and PayRate*/
SELECT A.*
INTO #WEEKLYTOTAL
FROM
(
SELECT 
	a.PersonId
	, Quantity = 40
	, PayRate = a.PayRateAmount
	, b.Description

FROM main.PersonPay a
JOIN main.personpayrate b on b.personpayrateid = a.PayRateId
JOIN main.Person p on p.PersonId = a.PersonId

WHERE 
(b.Description like '%salary%' OR b.Description like '%commission%' or b.Description = 'Hourly (Tech)' or b.Description = 'Hourly (Direct)')

AND p.IsActive = 1
--AND p.PersonId not in (select personid from main.PersonTypeMapping where PersonTypeId = 18)
AND @PayPeriodEndDate between a.PayRateBeginDate and a.PayRateEndDate

UNION ALL

SELECT 
	a.PersonId
	, h.Quantity
	, PayRate = a.PayRateAmount
	, b.Description

FROM main.PersonPay a
JOIN main.personpayrate b on b.personpayrateid = a.PayRateId
JOIN main.Person p on p.PersonId = a.PersonId
JOIN #HOURS h on h.PersonId = a.PersonId --Include total hours worked during the week

WHERE 
(b.PersonPayRateId in (81,87))

AND p.IsActive = 1
--AND p.PersonId not in (select personid from main.PersonTypeMapping where PersonTypeId = 18)
AND @PayPeriodEndDate between a.PayRateBeginDate and a.PayRateEndDate


) A

--select * from #WEEKLYTOTAL order by PersonId desc
--select * from #WEEKLYVALUE

INSERT INTO Main.PersonPTO (PersonId, PersonPTOTypeId, Notes, CreatedOn, UpdatedOn, LastUpdatePersonId, PersonPTOValue, PersonPTOQty) 

SELECT 
	wt.PersonId
	,wv.PersonPTOTypeId
	,Notes = 'Weekly ' + CAST(wv.PersonPTOQty as VARCHAR) + ' ADMINPPE' + CAST(@PayPeriodEndDate as varchar)
	,CreatedOn = @PayPeriodEndDate
	,UpdatedOn = getdate()
	,LastUpdateBy = @LastUpdateBy
	,PersonPTOValue = 0 --5/20 Per Al don't track $$ associated with PTO for salary/hourly.  When they cash out, just take it at current rate
		--CASE WHEN wt.Description like '%salary%' then wt.PayRate / 40 / 52 * wv.PersonPTOQty 
		--WHEN wt.Description like '%commission%' then wt.PayRate * wv.PersonPTOQty 
		--WHEN wt.Description like '%hourly%' then wt.PayRate * wv.PersonPTOQty / 40 * wt.Quantity --adjust to actual hours
		--else null END	--5/4/2022 Per Al Include $$ amount, and take all hourly folks at 40 hour week  old note: 12/28 Per Lori do not attach $$ to Value
	,PersonPTOQty = 
		CASE WHEN wt.Description like '%salary%' then wv.PersonPTOQty
		WHEN wt.Description like '%commission%' then wv.PersonPTOQty
		WHEN wt.Description like '%hourly%' then wv.PersonPTOQty / 40 * wt.Quantity --adjust to actual hours
		else null end
FROM #WEEKLYTOTAL wt
--LEFT JOIN [main].[PersonPTODailyRate] dr on dr.DriverRate = wt.PayRate

JOIN #WEEKLYVALUE wv on wt.PersonId = wv.PersonId

--and wt.PersonId = 2605

--where wt.PersonId <> 73 05/03/2022 Lori asked that we no longer exclude John Norris

GO


