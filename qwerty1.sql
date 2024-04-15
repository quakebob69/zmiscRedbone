DROP FUNCTION IF EXISTS [payroll].[getLsDropCurrentPayPeriodMinus8Days]
GO

CREATE FUNCTION [payroll].[getLsDropCurrentPayPeriodMinus8Days] ()
RETURNS TABLE
AS
RETURN
(
	SELECT
		*
	FROM
		dispatch.LoadStop
	WHERE
		(StartDateTime >= DATEADD(day, -10, (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)))
		--LoadId >= 56201 and LoadId <= 56769 
)


/*
	SELECT
		*
	FROM
		dispatch.Load
 where loadid in (
select loadid from dispatch.LoadStop where loadid in (
	SELECT
		 loadid
	FROM
		dispatch.LoadStop
	WHERE
		StartDateTime is null


		)
		)

		order by LoadId desc



		

select * from dispatch.LoadStop where loadid in (
	SELECT
		 loadid
	FROM
		dispatch.LoadStop
	WHERE
		StartDateTime is null

		and LoadStopTypeId = 1
		)
				order by LoadId desc
*/