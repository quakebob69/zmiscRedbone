DROP FUNCTION IF EXISTS [payroll].[getCurrentPayPeriodMinus8DaysLsDropRecs]
GO

CREATE FUNCTION [payroll].[getCurrentPayPeriodMinus8DaysLsDropRecs] ()
RETURNS TABLE
AS
RETURN
(
	SELECT
		*
	FROM
		dispatch.LoadStop
	WHERE
		(StartDateTime >= DATEADD(day, -8, (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)))
)
