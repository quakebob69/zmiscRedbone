
/*DROP VIEW IF EXISTS [payroll].[vLoadCurrentPayPeriod]
GO*/

DROP VIEW IF EXISTS [payroll].[vLsDropCurrentPayPeriodMinus8Days]
GO

CREATE VIEW [payroll].[vLsDropCurrentPayPeriodMinus8Days] AS

	SELECT
		*
	FROM
		payroll.getCurrentPayPeriodMinus8DaysLsDropRecs('12/10/2023')

GO



select * from [payroll].[vLsDropCurrentPayPeriodMinus8Days];