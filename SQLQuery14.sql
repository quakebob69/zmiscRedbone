	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775
																																										
-------------------------------------
SET @OpenPayPeriodId = 2
-------------------------------------
--TOTALS
	-- CURRENT PP
		select
			count(*) as 'PP ALL'
		from 
		export.AccountingExportPayrollData exdata where PayPeriodId = @OpenPayPeriodId


		select
			count(*) as 'PP PAID'
		from 
		export.AccountingExportPayrollData exdata where PayPeriodId = @OpenPayPeriodId
			AND OriginatingOTRPayPeriodId = @OpenPayPeriodId

		select
			count(*) as 'PP HELD'
		from 
		export.AccountingExportPayrollData exdata where PayPeriodId = @OpenPayPeriodId
			AND PayPeriodId IS NULL

		select
			count(*) as 'PP UNHELD'
		from 
		export.AccountingExportPayrollData exdata where PayPeriodId = @OpenPayPeriodId
			AND PayPeriodId IS NULL

	-- ALL
		select
			count(*) as 'ALL HELD'
		from 
		export.AccountingExportPayrollData exdata where PayPeriodId = @OpenPayPeriodId
			AND PayPeriodId IS NULL


		select
			count(*) as 'ALL UNHELD'
		from 
		export.AccountingExportPayrollData exdata where PayPeriodId = @OpenPayPeriodId
			AND PayPeriodId IS NULL


/*
	--GROUPS
		select
			[PersonId],
			[AccountingExportPayrollEntryTypeId],
			[AccountingExportPayrollItemId],
			[OriginatingOTRPayPeriodId],
			[PayPeriodId]
		from 
			export.AccountingExportPayrollData exdata where OriginatingOTRPayPeriodId = @OpenPayPeriodId
		group by
			[PersonId],
			[AccountingExportPayrollEntryTypeId],
			[AccountingExportPayrollItemId],
			[OriginatingOTRPayPeriodId],
			[PayPeriodId]
*/

