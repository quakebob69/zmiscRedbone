DROP FUNCTION IF EXISTS [payroll].[getCurrentPayPeriodMinus8DaysLoadRecs]
GO

CREATE FUNCTION [payroll].[getCurrentPayPeriodMinus8DaysLoadRecs] ()
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

