--exec [payroll].[sp_Payroll_OTR_PayPeriodReset] 2775

exec [payroll].[sp_Payroll_OTR_PayPeriodOpen] 2775
--exec [payroll].[sp_Payroll_OTR_StagePayroll] 1, 0, 775
--exec [payroll].[sp_Payroll_OTR_StagePayroll] 0, 1, 775

exec [payroll].[sp_Payroll_OTR_StagePayroll] 1, 1, 2775



	--exec payroll.sp_Payroll_OTR_StagePayrollDriverPay 2775
	--exec payroll.sp_Payroll_OTR_StagePayrollLoad 2775



	--delete from [export].[AccountingExportPayrollData]


---------------------------------------------------------------------------------------------------------------------------------
/*
	select PayPeriodId, PersonId, PayrollOTRDataSourceId, *
	from [export].[vAccountingExportPayrollDataCurrentPeriod] d
	--where PaidOTRPayPeriodId is null
	order by d.PayPeriodId, d.PayrollOTRDataSourceId, d.PersonId
*/

--select * from export
---------------------------------------------------------------------------------------------------------------------------------
	--419
		select COUNT(*) from payroll.PayrollOTRStaging WHERE PayrollOTRDataSourceId = 1;
	--59
		select COUNT(*) from payroll.PayrollOTRStaging WHERE PayrollOTRDataSourceId = 2;

	--296
		select COUNT(*) from export.AccountingExportPayrollData WHERE PayrollOTRDataSourceId = 1;
	--59
		select COUNT(*) from export.AccountingExportPayrollData WHERE PayrollOTRDataSourceId = 2;
	--355
		--select COUNT(*) from export.AccountingExportPayrollData;

