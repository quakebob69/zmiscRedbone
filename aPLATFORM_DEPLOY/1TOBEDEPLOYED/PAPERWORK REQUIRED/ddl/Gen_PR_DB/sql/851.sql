DROP FUNCTION IF EXISTS [payroll].[getLoadStopCurrentPayPeriod]
GO

CREATE FUNCTION [payroll].[getLoadStopCurrentPayPeriod] ()
RETURNS TABLE
AS
RETURN
(
	SELECT
		*
	FROM
		dispatch.LoadStop
	WHERE
		LoadId in 
		(
			SELECT
				LoadId
			FROM
				payroll.getLoadStopCurrentPayPeriodLoadIds()
		)
)

