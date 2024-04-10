DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDF]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriodPDF] AS

			select TOP (1000000) 
				PayPeriodId,
				CONCAT(pers.firstName, ' ', pers.lastName) AS full_name,
				typ.Name as type_name,
				itm.Name as item_name,
				Sum(Quantity) as 'Quantity'
			from 
				export.AccountingExportPayrollData exdata
				join main.Person pers on exdata.PersonId = pers.PersonId
				join export.AccountingExportPayrollEntryType typ on exdata.AccountingExportPayrollEntryTypeId = typ.AccountingExportPayrollEntryTypeId
				join export.AccountingExportPayrollItem itm on exdata.AccountingExportPayrollItemId = itm.AccountingExportPayrollItemId
			where------------------------------------------------------------------------
				(exdata.PersonId = 2451 OR exdata.PersonId =  1252) and
				PayPeriodId = (SELECT
												TOP 1 PayrollOTRPayPeriodId 
												FROM [payroll].[PayrollOTRPayPeriod]
												WHERE
												IsActive = 1)
			group by
				PayPeriodId,
				CONCAT(pers.firstName, ' ', pers.lastName),
				typ.Name,
				itm.Name
			order by 
				PayPeriodId,
				full_name,
				typ.Name,
				itm.Name

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
				PayPeriodId,
				CONCAT(pers.firstName, ' ', pers.lastName) AS full_name,
				typ.Name as type_name,
				itm.Name as item_name,
				OriginatingOTRPayPeriodId,
				LoadIdOrDriverPayId,
				PayrollOTRPaymentHoldReasonId,
				Rate,
				Hours,
				Quantity
			from 
				export.AccountingExportPayrollData exdata
				join main.Person pers on exdata.PersonId = pers.PersonId
				join export.AccountingExportPayrollEntryType typ on exdata.AccountingExportPayrollEntryTypeId = typ.AccountingExportPayrollEntryTypeId
				join export.AccountingExportPayrollItem itm on exdata.AccountingExportPayrollItemId = itm.AccountingExportPayrollItemId
			where------------------------------------------------------------------------
				(exdata.PersonId = 2451 OR exdata.PersonId =  1252) and
				PayPeriodId = (SELECT
												TOP 1 PayrollOTRPayPeriodId 
												FROM [payroll].[PayrollOTRPayPeriod]
												WHERE
												IsActive = 1)
			order by 
				PayPeriodId,
				full_name,
				typ.Name,
				itm.Name

	GO

SELECT * from export.vAccountingExportPayrollDataCurrentPeriodPDFDetail
