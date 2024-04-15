DROP VIEW IF EXISTS [payroll].[vPayrollOTROpenPayPeriod]
GO

DROP VIEW IF EXISTS [payroll].[vPayrollOTRCurrentPayPeriod]
GO


CREATE VIEW [payroll].[vPayrollOTRCurrentPayPeriod] AS

	SELECT
		*
	FROM
		[payroll].PayrollOTRPayPeriod
	WHERE
		IsActive = 1

GO

CREATE VIEW [payroll].[vPayrollOTROpenPayPeriod] AS

	SELECT
		*
	FROM
		[payroll].PayrollOTRPayPeriod
	WHERE
		IsOpen = 1

GO










declare	@PayPeriodStart date
declare @PayPeriodEnd date
set	@PayPeriodStart='12/10/2023'
SET @PayPeriodEnd='12/16/2023'



-- 1)  get loads without Legs
		-- AND NOT EXISTS (SELECT 1 FROM dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2)

-- 2)  get legs 
		-- [NOTHING]
    select 
            l.LoadId
            -- First Pick
            ,LoadStopId_Pick = lsPick.LoadStopId
            -- next LEG or Last Drop (if no other legs)
            ,LoadStopId_Drop =  lsDrop.LoadStopId
            ,LegInd = 1
    from 
            dispatch.vDispatchCurrentPeriod.Load l
            INNER JOIN dispatch.vLoadStopCurrentPeriod lsPick on lsPick.LoadId = l.LoadId and lsPick.LoadStopTypeId = 2
            -- get the next leg or last drop
            INNER JOIN dispatch.vLoadStopCurrentPeriod lsDrop on lsDrop.LoadStopId = iif(exists(select top 1 LoadStopId from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2 and StopNumber > lsPick.StopNumber order by StopNumber asc)
                                                            ,(select top 1 LoadStopId from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2 and StopNumber > lsPick.StopNumber order by StopNumber)
                                                            ,(SELECT TOP 1 LoadStopId FROM dispatch.LoadStop WHERE LoadId = l.LoadId AND LoadStopTypeId = 3 ORDER BY StopNumber desc))
            inner join main.Person p1 on p1.PersonId = lsPick.Driver1_PersonId
            left outer join main.Person p2 on p2.PersonId = isnull(lsPick.Driver2_PersonId,0)
    where 
            l.LoadStatusTypeId <> 100 -- don't include cancelled loads.
            -- Pick either StartDateTime or DropStartDateTime based on if the stop is a LEG or not
            and iif(lsDrop.LoadStopTypeId = 2, Convert(Date, lsDrop.DropStartDateTime), convert(DATE, lsDrop.StartDateTime)) between @PayPeriodStart and @PayPeriodEnd
            and
            (
                    p1.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p1.PersonId and PersonTypeId = 4)
                    or isnull(p2.PersonId,0) in (select PersonId from main.PersonTypeMapping where PersonId = p2.PersonId and PersonTypeId = 4)
            )


-- 3)  get Loads that have legs
		-- AND EXISTS (SELECT LoadStopId FROM dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2)
