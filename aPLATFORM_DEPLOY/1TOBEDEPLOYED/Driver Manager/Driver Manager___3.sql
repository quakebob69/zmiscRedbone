DROP VIEW IF EXISTS [payroll].[vPayrollOTRCurrentPayPeriod]
GO


CREATE VIEW [payroll].[vPayrollOTRCurrentPayPeriod] AS

	SELECT
		*
	FROM
		[payroll].PayrollOTRPayPeriod
	WHERE
		IsActive = 1

GO
