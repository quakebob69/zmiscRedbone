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
		[payroll].PayrollOTRPayPeriod pp
	WHERE
		pp.IsActive = 1

GO

CREATE VIEW [payroll].[vPayrollOTROpenPayPeriod] AS

	SELECT
		*
	FROM
		[payroll].PayrollOTRPayPeriod pp
	WHERE
		pp.IsOpen = 1

GO

CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriod] AS

	SELECT
		AccountingExportPayrollDataId,
		OriginatingOTRPayPeriodId,
		PaidOTRPayPeriodId,
		PersonId,
		AccountingExportPayrollEntryTypeId,
		AccountingExportPayrollItemId,
		PayrollOTRDataSourceId,
		PayrollOTRPaymentHoldReasonId,
		LoadId,
		Rate,
		Hours,
		Quantity
	FROM
		[export].[AccountingExportPayrollData] AS d
	WHERE
		d.OriginatingOTRPayPeriodId = 
			(
				SELECT
					pp.PayrollOTRPayPeriodId
				FROM
					[payroll].[vPayrollOTRCurrentPayPeriod] pp
			)

GO


