	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775


-- CURRENT PP
	--TOTALS
		select
			count(*) as 'ALL'
		from 
		export.AccountingExportPayrollData exdata where OriginatingOTRPayPeriodId = @OpenPayPeriodId

		select
			count(*) as 'PAID'
		from 
		export.AccountingExportPayrollData exdata where OriginatingOTRPayPeriodId = @OpenPayPeriodId
			AND PaidOTRPayPeriodId = @OpenPayPeriodId

		select
			count(*) as 'HELD'
		from 
		export.AccountingExportPayrollData exdata where OriginatingOTRPayPeriodId = @OpenPayPeriodId
			AND PaidOTRPayPeriodId IS NULL

	--GROUPS
		select
			[PersonId],
			[AccountingExportPayrollEntryTypeId],
			[AccountingExportPayrollItemId],
			[OriginatingOTRPayPeriodId],
			[PaidOTRPayPeriodId]
		from 
			export.AccountingExportPayrollData exdata where OriginatingOTRPayPeriodId = @OpenPayPeriodId
		group by
			[PersonId],
			[AccountingExportPayrollEntryTypeId],
			[AccountingExportPayrollItemId],
			[OriginatingOTRPayPeriodId],
			[PaidOTRPayPeriodId]


