--exec [payroll].[sp_Payroll_OTR_PayPeriodReset] 2775

exec [payroll].[sp_Payroll_OTR_PayPeriodOpen] 2775
--exec [payroll].[sp_Payroll_OTR_StagePayroll] 1, 0, 775
--exec [payroll].[sp_Payroll_OTR_StagePayroll] 0, 1, 775

exec [payroll].[sp_Payroll_OTR_StagePayroll] 1, 1, 775



	--exec payroll.sp_Payroll_OTR_StagePayrollDriverPay 2775
	--exec payroll.sp_Payroll_OTR_StagePayrollLoad 2775



	--delete from [export].[AccountingExportPayrollData]


---------------------------------------------------------------------------------------------------------------------------------


select
	PaidOTRPayPeriodId,
	PersonId,
	AccountingExportPayrollEntryTypeId,
	AccountingExportPayrollItemId,
	*
from
	[export].[vAccountingExportPayrollDataCurrentPeriod] p 
--where PaidOTRPayPeriodId is null
ORDER BY
	p.PaidOTRPayPeriodId,
	p.PersonId,
	p.AccountingExportPayrollEntryTypeId,
	p.AccountingExportPayrollItemId


---------------------------------------------------------------------------------------------------------------------------------







