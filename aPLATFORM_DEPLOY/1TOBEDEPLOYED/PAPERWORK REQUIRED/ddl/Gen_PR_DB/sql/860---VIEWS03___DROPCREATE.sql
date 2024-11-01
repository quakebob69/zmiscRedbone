--PDF
DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDF]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriodPDF] AS

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
									IsActive = 1)
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

--SELECT * from export.vAccountingExportPayrollDataCurrentPeriodPDF



--------------
--------------
--------------
--------------


--DETAIL
DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFDetail]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriodPDFDetail] AS

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
									IsActive = 1)
			order by 
				period_code,
				full_name,
				typ.Name,
				itm.Name

	GO

--SELECT * from export.vAccountingExportPayrollDataCurrentPeriodPDFDetail



--------------
--------------
--------------
--------------


--Held
DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFHeld]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriodPDFHeld] AS

			select TOP (1000000) 
				exdata.PayPeriodId as period_code,
				CONCAT(pers.firstName, ' ', pers.lastName) AS full_name,
				typ.Name as type_name,
				itm.Name as item_name,
				ppo.Code as period_code_orig,
				LoadIdOrDriverPayId,
				exdata.PayrollOTRPaymentHoldReasonId,
				hldrsn.Description as HoldReasonText,
				Rate,
				Hours,
				Quantity
			from 
				export.AccountingExportPayrollData exdata
				join main.Person pers on exdata.PersonId = pers.PersonId
				join export.AccountingExportPayrollEntryType typ on exdata.AccountingExportPayrollEntryTypeId = typ.AccountingExportPayrollEntryTypeId
				join export.AccountingExportPayrollItem itm on exdata.AccountingExportPayrollItemId = itm.AccountingExportPayrollItemId
				join payroll.PayrollOTRPayPeriod ppo on exdata.OriginatingOTRPayPeriodId = ppo.PayrollOTRPayPeriodId
				join payroll.PayrollOTRPaymentHoldReason hldrsn on exdata.PayrollOTRPaymentHoldReasonId = hldrsn.PayrollOTRPaymentHoldReasonId
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

--SELECT * from export.vAccountingExportPayrollDataCurrentPeriodPDFHeld



--------------
--------------
--------------
--------------


--Released
DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFReleased]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataCurrentPeriodPDFReleased] AS

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
													IsActive = 1)
				AND
				PayPeriodId != OriginatingOTRPayPeriodId
			order by 
				period_code,
				full_name,
				typ.Name,
				itm.Name

	GO

--ALL Held
DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataHeld]
GO

	CREATE VIEW [export].[vAccountingExportPayrollDataHeld] AS

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

--SELECT * from export.vAccountingExportPayrollDataCurrentPeriodPDFReleased
