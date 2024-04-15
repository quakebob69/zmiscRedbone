DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriod]
GO

DROP VIEW IF EXISTS [payroll].[vPayrollOTROpenPayPeriod]
GO

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

CREATE VIEW [payroll].[vPayrollOTROpenPayPeriod] AS

	SELECT
		*
	FROM
		[payroll].PayrollOTRPayPeriod
	WHERE
		IsOpen = 1

GO

CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriod] AS

	SELECT
		*
	FROM
		[export].[AccountingExportPayrollData]
	WHERE
		OriginatingOTRPayPeriodId = 
			(
				SELECT
					PayrollOTRPayPeriodId
				FROM
					[payroll].[vPayrollOTRCurrentPayPeriod]
			)

GO
