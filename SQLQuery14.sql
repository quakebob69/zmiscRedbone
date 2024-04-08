	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775
																																										
-------------------------------------
SET @OpenPayPeriodId = (select top 1 OriginatingOTRPayPeriodId from [export].[AccountingExportPayrollData] order by AccountingExportPayrollDataId desc)
--SELECT count(*) from [export].[AccountingExportPayrollData]; 
--SELECT @OpenPayPeriodId
-------------------------------------
--TOTALS
	-- CURRENT PP ONLY
		select
			AccountingExportPayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
		PayrollOTRDataSourceId,
		PayrollOTRPaymentHoldReasonId,
		Quantity,
		LoadId
		--count(*) as 'PP NEW'
		from 
		export.AccountingExportPayrollData exdata where OriginatingOTRPayPeriodId = @OpenPayPeriodId


		select
			AccountingExportPayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
		PayrollOTRDataSourceId,
		PayrollOTRPaymentHoldReasonId,
		Quantity,
		LoadId
		--count(*) as 'PP HELD'
		from 
		export.AccountingExportPayrollData exdata where OriginatingOTRPayPeriodId = @OpenPayPeriodId
			AND AccountingExportPayPeriodId IS NULL


		select
			AccountingExportPayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
		PayrollOTRDataSourceId,
		PayrollOTRPaymentHoldReasonId,
		Quantity,
		LoadId
		--count(*) as 'PP PAID'
		from 
		export.AccountingExportPayrollData exdata where AccountingExportPayPeriodId = @OpenPayPeriodId


			/*
	select ' --------------------------------------------- ---------------------------------------------'

			--select top 1 AccountingExportPayrollDataId from [export].[AccountingExportPayrollData] order by AccountingExportPayrollDataId desc
			--select AccountingExportPayrollDataId from [export].[AccountingExportPayrollData] order by AccountingExportPayrollDataId desc


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
			[AccountingExportPayPeriodId],
			[PayPeriodId]
		from 
			export.AccountingExportPayrollData exdata where AccountingExportPayPeriodId = @OpenPayPeriodId
		group by
			[PersonId],
			[AccountingExportPayrollEntryTypeId],
			[AccountingExportPayrollItemId],
			[AccountingExportPayPeriodId],
			[PayPeriodId]
*/

