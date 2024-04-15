DROP FUNCTION IF EXISTS [payroll].[getCurrentPayPeriodLoadRecs]
GO

CREATE FUNCTION [payroll].[getCurrentPayPeriodLoadRecs] (
    @PayPeriodStart DATE
)
RETURNS TABLE
AS
RETURN
(
	SELECT
		*
	FROM
		dispatch.LoadStop
	WHERE
		(StartDateTime >= DATEADD(day, -8, @PayPeriodStart))
);