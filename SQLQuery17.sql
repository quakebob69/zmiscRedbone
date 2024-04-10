DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDF]
GO

CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriodPDF] AS

	
		select TOP (1000000) 
			AccountingExportPayPeriodId,
			pers.firstName || ' ' || pers.lastName as fullName,
			exdata.PersonId as 'asdf'
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			Sum(Quantity) as 'Quantity'
		from 
			export.AccountingExportPayrollData exdata
			join main.Person pers on exdata.PersonId = p.PersonId

		where------------------------------------------------------------------------
			(exdata.PersonId = 2451 OR exdata.PersonId =  1252) and
			AccountingExportPayPeriodId = (SELECT
											TOP 1 PayrollOTRPayPeriodId 
											FROM [payroll].[PayrollOTRPayPeriod]
											WHERE
											IsActive = 1)
		group by
			AccountingExportPayPeriodId,
			exdata.PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId
		order by 
			AccountingExportPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId

GO


SELECT * from export.vAccountingExportPayrollDataCurrentPeriodPDF



--------------
--------------
--------------
--------------



DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFDetail]
GO

CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriodPDFDetail] AS

	
		select TOP (1000000) 
			AccountingExportPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			Quantity
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
			AccountingExportPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId

GO


SELECT * from export.vAccountingExportPayrollDataCurrentPeriodPDFDetail





