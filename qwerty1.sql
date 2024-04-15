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
		(StartDateTime >= DATEADD(day, -8, (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)))
)
