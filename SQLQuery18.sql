--PDF
DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataPastPDF]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataPastPDF] AS

			select TOP (1000000) 
				pp.Code as period_code,
				CONCAT(pers.firstName, ' ', pers.lastName) AS full_name,
				typ.Name as type_name,
				itm.Name as item_name,
				Sum(Quantity) as 'Quantity'
			from 
				export.AccountingExportPayrollData exdata
				join main.Person pers on exdata.PersonId = pers.PersonId
				join export.AccountingExportPayrollEntryType typ on exdata.AccountingExportPayrollEntryTypeId = typ.AccountingExportPayrollEntryTypeId
				join export.AccountingExportPayrollItem itm on exdata.AccountingExportPayrollItemId = itm.AccountingExportPayrollItemId
				join payroll.PayrollOTRPayPeriod pp on exdata.PayPeriodId = pp.PayrollOTRPayPeriodId
			where------------------------------------------------------------------------
				--(exdata.PersonId = 2451 OR exdata.PersonId =  1252) and
				PayPeriodId = (SELECT
												TOP 1 PayrollOTRPayPeriodId 
												FROM [payroll].[PayrollOTRPayPeriod]
												WHERE
												IsActive = 0)
			group by
				pp.Code,
				CONCAT(pers.firstName, ' ', pers.lastName),
				typ.Name,
				itm.Name
			order by 
				period_code,
				full_name,
				typ.Name,
				itm.Name

	GO

SELECT * from export.vAccountingExportPayrollDataPastPDF



--------------
--------------
--------------
--------------


--DETAIL
DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataPastPDFDetail]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataPastPDFDetail] AS

			select TOP (1000000) 
				pp.Code as period_code,
				CONCAT(pers.firstName, ' ', pers.lastName) AS full_name,
				typ.Name as type_name,
				itm.Name as item_name,
				ppo.Code as period_code_orig,
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
				join payroll.PayrollOTRPayPeriod pp on exdata.PayPeriodId = pp.PayrollOTRPayPeriodId
				join payroll.PayrollOTRPayPeriod ppo on exdata.OriginatingOTRPayPeriodId = ppo.PayrollOTRPayPeriodId
			where------------------------------------------------------------------------
				--(exdata.PersonId = 2451 OR exdata.PersonId =  1252) and
				PayPeriodId = (SELECT
												TOP 1 PayrollOTRPayPeriodId 
												FROM [payroll].[PayrollOTRPayPeriod]
												WHERE
												IsActive = 0)
			order by 
				period_code,
				full_name,
				typ.Name,
				itm.Name

	GO

SELECT * from export.vAccountingExportPayrollDataPastPDFDetail



--------------
--------------
--------------
--------------


--Held
DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataPastPDFHeld]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataPastPDFHeld] AS

			select TOP (1000000) 
				exdata.PayPeriodId as period_code,
				CONCAT(pers.firstName, ' ', pers.lastName) AS full_name,
				typ.Name as type_name,
				itm.Name as item_name,
				ppo.Code as period_code_orig,
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
				join payroll.PayrollOTRPayPeriod ppo on exdata.OriginatingOTRPayPeriodId = ppo.PayrollOTRPayPeriodId
			where------------------------------------------------------------------------
				--(exdata.PersonId = 2451 OR exdata.PersonId =  1252) and
				OriginatingOTRPayPeriodId = (SELECT
													TOP 1 PayrollOTRPayPeriodId 
													FROM [payroll].[PayrollOTRPayPeriod]
													WHERE
													IsActive = 1)
				AND
				PayPeriodId IS NULL
			order by 
				period_code,
				full_name,
				typ.Name,
				itm.Name

	GO

SELECT * from export.vAccountingExportPayrollDataPastPDFHeld
