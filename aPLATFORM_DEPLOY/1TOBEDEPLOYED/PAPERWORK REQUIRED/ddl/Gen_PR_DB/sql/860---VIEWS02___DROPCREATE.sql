DROP VIEW IF EXISTS [payroll].[vLoadCurrentPayPeriod]
GO

DROP VIEW IF EXISTS [payroll].[vLoadStopCurrentPayPeriod]
GO

CREATE VIEW [payroll].[vLoadStopCurrentPayPeriod] AS

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

GO


CREATE VIEW [payroll].[vLoadCurrentPayPeriod] AS

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

GO
