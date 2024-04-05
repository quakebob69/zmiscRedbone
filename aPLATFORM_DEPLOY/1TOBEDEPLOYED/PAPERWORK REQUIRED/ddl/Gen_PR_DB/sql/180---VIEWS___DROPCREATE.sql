DROP VIEW IF EXISTS [payroll].[vAccountingExportPayrollDataCurrentPeriod]
GO
	

CREATE VIEW [payroll].[vAccountingExportPayrollDataCurrentPeriod] AS

	SELECT *
	FROM [export].[AccountingExportPayrollData] AS d

		--WHERE 
		--	d.

GO