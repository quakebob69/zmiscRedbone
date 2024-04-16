DROP FUNCTION IF EXISTS [payroll].[getLoadCurrentPayPeriod]
GO

CREATE FUNCTION [payroll].[getLoadCurrentPayPeriod] ()
RETURNS TABLE
AS
RETURN
(
	SELECT
		*
	FROM
		dispatch.Load
	WHERE
		LoadId in 
		(
			SELECT
				LoadId
			FROM
				payroll.getLoadStopCurrentPayPeriodLoadIds()
		)
)
