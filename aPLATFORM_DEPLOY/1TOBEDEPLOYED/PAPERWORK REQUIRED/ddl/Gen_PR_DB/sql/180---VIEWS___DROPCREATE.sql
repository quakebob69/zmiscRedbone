DROP VIEW IF EXISTS [payroll].[vAccountingExportPayrollDataCurrentPeriod]
GO
	

CREATE VIEW [payroll].[vAccountingExportPayrollDataCurrentPeriod] AS

	SELECT
		*
	FROM
		[export].[AccountingExportPayrollData] AS d
	WHERE
		D.OriginatingOTRPayPeriodId = 
			(
				SELECT
					pp.IsActive
				FROM
					[payroll].PayrollOTRPayPeriod pp
				WHERE
					pp.IsActive = 1
			)

GO