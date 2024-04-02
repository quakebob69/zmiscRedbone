/****** Object:  StoredProcedure [payroll].[sp_PayrollPTO_OTR_Accrual]    Script Date: 2/14/2024 10:11:01 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_OTR_Accrual]
GO

/****** Object:  StoredProcedure [payroll].[sp_PayrollPTO_OTR_Accrual]    Script Date: 2/14/2024 10:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [payroll].[sp_PayrollPTO_OTR_Accrual]
(

@PayPeriodEndDate Date
,@LastUpdateBy Int

-- exec sp_Payroll_OTR_PTO_Accrual '06/03/2023', 6

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

DELETE FROM main.PersonPTO 
WHERE len(cast(notes as varchar))>15
AND substring(cast(notes as varchar(256)), len(cast(notes as varchar(256)))-15,18)
='OTRPPE' + CAST(year(@PayPeriodEndDate) as VARCHAR) + '-' + right('0' + CAST(month(@PayPeriodEndDate) AS VARCHAR),2) + '-' +  right('0' + CAST(day(@PayPeriodEndDate) AS VARCHAR),2)

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
		and (sh.StatusChangeDate is not null OR
		sh1.StatusChangeDate is not null OR
		sh4.StatusChangeDate is not null)
--	and ptm.PersonTypeId in (1,2)

GROUP BY 
	p.PersonId, FirstName + ' ' + LastName, ptgm.PersonPTOGroupId

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
			
/*Calculate Person PTO Weekly Unit of Accrual based on YOS*/
SELECT 
	yos.PersonId
	, pt.PersonPTOName
	, pt.PersonPTOQty
	, pt.PersonPTOTypeId 

INTO #WEEKLYVALUE
FROM #YEARSOFSERVICE yos
JOIN main.PersonPTOType pt on pt.PersonPTOGroupTypeId = yos.PersonPTOGroupId and yos.YearsOfService between pt.LowerPTO and pt.UpperPTO


/*OTR calculate weekly quantity of miles, plus associated PayID and PayRate*/
SELECT 
	DriverPersonId
	,Quantity = sum(Quantity)
	,PayId
	,pp.PayRateAmount
	,ppr.Description

INTO #WEEKLYTOTAL

FROM payrollTEMPDANNY.PR_OTR_History___payrollTEMPDANNY h
LEFT JOIN main.PersonPay pp on pp.PersonId = h.DriverPersonId and h.PayId = pp.PayRateId 
LEFT JOIN main.PersonPayRate ppr on ppr.PersonPayRateId = h.PayId

WHERE PayCode like '%Per Mile%'
	AND h.PayCode NOT LIKE '%Trainer%'
	AND h.PayCode NOT LIKE '%Doubles%'
	AND PayPeriodEnding = @PayPeriodEndDate
	AND @PayPeriodEndDate between PayRateBeginDate and PayRateEndDate

GROUP BY DriverPersonId, PayId, pp.PayRateAmount, ppr.Description

--select * from #WEEKLYTOTAL
--select * from #WEEKLYVALUE

INSERT INTO Main.PersonPTO (PersonId, PersonPTOTypeId, Notes, CreatedOn, UpdatedOn, LastUpdatePersonId, PersonPTOValue, PersonPTOQty) 

SELECT 
	wt.DriverPersonId
	,wv.PersonPTOTypeId
	,Notes = CAST(wt.Quantity as VARCHAR) +  ' Miles @ ' + CAST(wt.PayRateAmount as VARCHAR) + ' ' + wt.Description + ' x ' + CAST(wv.PersonPTOQty as VARCHAR) + ' OTRPPE' + CAST(@PayPeriodEndDate as varchar)
	,CreatedOn = @PayPeriodEndDate
	,UpdatedOn = getdate()
	,LastUpdateBy = @LastUpdateBy
	,PersonPTOValue = wt.Quantity * wt.PayRateAmount * wv.PersonPTOQty 
	--,PersonPTOQty = (wt.Quantity * wt.PayRateAmount * wv.PersonPTOQty) / dr.DailyRate
	,PersonPTOQty = wt.Quantity / (	CASE WHEN wv.PersonPTOQty = .0192 then 28800 else 14400 END) --144000 / 5 days = 28800 for 1 day PTO < 1 yr tenure.   144000 / 10 days = 14400 for 1 day PTO > 1 year tenure

FROM #WEEKLYTOTAL wt
--LEFT JOIN [main].[PersonPTODailyRate] dr on dr.DriverRate = wt.PayRateAmount

JOIN #WEEKLYVALUE wv on wt.DriverPersonId = wv.PersonId

WHERE WT.DriverPersonId in (select PersonId from main.PersonPTOGroupMapping where PersonPTOGroupId = 3)--only include drivers

--and wt.DriverPersonId = 2177




GO


