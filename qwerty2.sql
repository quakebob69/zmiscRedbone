DROP FUNCTION IF EXISTS [payroll].[getLoadCurrentPayPeriodMinus8Days]
GO

CREATE FUNCTION [payroll].[getLoadCurrentPayPeriodMinus8Days] ()
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
				payroll.getLsDropCurrentPayPeriodMinus8Days()
		)
)

