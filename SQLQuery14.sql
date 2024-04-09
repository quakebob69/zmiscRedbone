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
			--AccountingExportPayPeriodId,
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
			OriginatingOTRPayPeriodId = @OpenPayPeriodId
			OR
			AccountingExportPayPeriodId = @OpenPayPeriodId



		select
		--AccountingExportPayrollDataId as 'ID', 
		'RELEASED ---> ' as ' ',
			AccountingExportPayPeriodId,
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
			AccountingExportPayPeriodId = @OpenPayPeriodId
			AND
			AccountingExportPayPeriodId != OriginatingOTRPayPeriodId



		select
		--AccountingExportPayrollDataId as 'ID', 
		'NEW ---> ' as ' ',
			AccountingExportPayPeriodId,
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
			OriginatingOTRPayPeriodId = @OpenPayPeriodId



		select
		--AccountingExportPayrollDataId as 'ID', 
		'HELD ---> ' as ' ',
			AccountingExportPayPeriodId,
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
			OriginatingOTRPayPeriodId = @OpenPayPeriodId
			AND
			AccountingExportPayPeriodId IS NULL



		select
		--AccountingExportPayrollDataId as 'ID', 
		'PAID ---> ' as ' ',
			AccountingExportPayPeriodId,
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
			AccountingExportPayPeriodId = @OpenPayPeriodId



		select
		'QB ---> ' as ' ',
			AccountingExportPayPeriodId,
			--OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId,
			Sum(Quantity) as 'Quantity'
		from 
			export.AccountingExportPayrollData exdata
		where------------------------------------------------------------------------
			PersonId = 2451 and
			AccountingExportPayPeriodId = @OpenPayPeriodId
		group by
			AccountingExportPayPeriodId,
			OriginatingOTRPayPeriodId,
			PersonId,
			AccountingExportPayrollEntryTypeId,
			AccountingExportPayrollItemId

