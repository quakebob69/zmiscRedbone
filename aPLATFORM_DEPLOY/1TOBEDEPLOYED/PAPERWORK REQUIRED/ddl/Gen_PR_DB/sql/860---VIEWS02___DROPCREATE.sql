DROP VIEW IF EXISTS [payroll].[vLoadCurrentPayPeriod]
GO

DROP VIEW IF EXISTS [payroll].[vLoadStopCurrentPayPeriod]
GO

CREATE VIEW [payroll].[vLoadStopCurrentPayPeriod] AS

	SELECT
		*
	FROM
		payroll.getLoadStopCurrentPayPeriod()

GO


CREATE VIEW [payroll].[vLoadCurrentPayPeriod] AS

	SELECT
		*
	FROM
		payroll.getLoadCurrentPayPeriod()

GO
