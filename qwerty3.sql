DROP VIEW IF EXISTS [payroll].[vLoadCurrentPayPeriodMinus8Days]
GO

DROP VIEW IF EXISTS [payroll].[vLsDropCurrentPayPeriodMinus8Days]
GO

CREATE VIEW [payroll].[vLsDropCurrentPayPeriodMinus8Days] AS

	SELECT
		*
	FROM
		payroll.getLsDropCurrentPayPeriodMinus8Days()

GO


CREATE VIEW [payroll].[vLoadCurrentPayPeriodMinus8Days] AS

	SELECT
		*
	FROM
		payroll.getLoadCurrentPayPeriodMinus8Days()

GO


/*
	select * from [payroll].[vLoadCurrentPayPeriodMinus8Days] order by loadid;
	select * from [payroll].[vLsDropCurrentPayPeriodMinus8Days] order by loadid;
*/