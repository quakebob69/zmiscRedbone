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
		--AccountingExportPayrollDataId as 'ID', 
		'ALL ---> ' as ' ',
			--PayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			LoadIdOrDriverPayId,
		PayrollOTRPaymentHoldReasonId,
		Quantity
		from 
			export.AccountingExportPayrollData exdata
		where------------------------------------------------------------------------
			(PersonId = 8) and (
				OriginatingOTRPayPeriodId = @OpenPayPeriodId
				OR
				PayPeriodId = @OpenPayPeriodId
			)


		select
		--AccountingExportPayrollDataId as 'ID', 
		'RELEASED ---> ' as ' ',
			PayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			LoadIdOrDriverPayId,
		PayrollOTRPaymentHoldReasonId,
		Quantity
		from 
			export.AccountingExportPayrollData exdata
		where------------------------------------------------------------------------
			(PersonId = 8) and (
				PayPeriodId = @OpenPayPeriodId
				AND
				PayPeriodId != OriginatingOTRPayPeriodId
			)


		select
		--AccountingExportPayrollDataId as 'ID', 
		'NEW ---> ' as ' ',
			PayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			LoadIdOrDriverPayId,
		PayrollOTRPaymentHoldReasonId,
		Quantity
		from 
			export.AccountingExportPayrollData exdata 
		where------------------------------------------------------------------------
			(PersonId = 8) and
			OriginatingOTRPayPeriodId = @OpenPayPeriodId



		select
		--AccountingExportPayrollDataId as 'ID', 
		'HELD ---> ' as ' ',
			PayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			LoadIdOrDriverPayId,
		PayrollOTRPaymentHoldReasonId,
		Quantity
		from 
			export.AccountingExportPayrollData exdata 
		where------------------------------------------------------------------------
			(PersonId = 8) and (
				OriginatingOTRPayPeriodId = @OpenPayPeriodId
				AND
				PayPeriodId IS NULL
			)


		select
		--AccountingExportPayrollDataId as 'ID', 
		'PAID ---> ' as ' ',
			PayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			LoadIdOrDriverPayId,
		PayrollOTRPaymentHoldReasonId,
		Quantity
		from 
			export.AccountingExportPayrollData exdata
		where------------------------------------------------------------------------
			(PersonId = 8) and
			PayPeriodId = @OpenPayPeriodId



		select
		'QB ---> ' as ' ',
			PayPeriodId,
			--OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			Sum(Quantity) as 'Quantity'
		from 
			export.AccountingExportPayrollData exdata
		where------------------------------------------------------------------------
			(PersonId = 8) and
			PayPeriodId = @OpenPayPeriodId
		group by
			PayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId

