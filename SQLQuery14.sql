	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775
																																										
-------------------------------------
SET @OpenPayPeriodId = 4
-------------------------------------
--TOTALS
	-- CURRENT PP ONLY
		select
			count(*) as 'PP ALL'
		from 
		export.AccountingExportPayrollData exdata where AccountingExportPayPeriodId = @OpenPayPeriodId

		select
			count(*) as 'PP PAID'
		from 
		export.AccountingExportPayrollData exdata where AccountingExportPayPeriodId = @OpenPayPeriodId
			AND OriginatingOTRPayPeriodId = @OpenPayPeriodId

		select
			count(*) as 'PP HELD'
		from 
		export.AccountingExportPayrollData exdata where AccountingExportPayPeriodId = @OpenPayPeriodId
			AND AccountingExportPayPeriodId IS NULL

		select
			count(*) as 'PP UNHOLDING'
		from 
		export.AccountingExportPayrollData exdata where AccountingExportPayPeriodId = @OpenPayPeriodId
			AND OriginatingOTRPayPeriodId != AccountingExportPayPeriodId




			/*
	select ' --------------------------------------------- ---------------------------------------------'

	-- ALL HISTORY
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
			*/

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

