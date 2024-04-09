DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDF]
GO

CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriodPDF] AS

	
		select
		'QB ---> ' as ' ',
			AccountingExportPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			Sum(Quantity) as 'Quantity'
		from 
			export.AccountingExportPayrollData exdata
		where------------------------------------------------------------------------
			(PersonId = 2451 OR PersonId =  1252) and
			AccountingExportPayPeriodId = (SELECT
											TOP 1 PayrollOTRPayPeriodId 
											FROM [payroll].[PayrollOTRPayPeriod]
											WHERE
											IsActive = 1)
		order by 
			
		group by
			AccountingExportPayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId

GO


SELECT * from export.vAccountingExportPayrollDataCurrentPeriodPDF





