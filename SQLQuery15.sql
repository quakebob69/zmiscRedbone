--exec [payroll].[sp_Payroll_OTR_PayPeriodReset] 2775

exec [payroll].[sp_Payroll_OTR_PayPeriodOpen] 2775
--exec [payroll].[sp_Payroll_OTR_StagePayroll] 1, 0, 775
--exec [payroll].[sp_Payroll_OTR_StagePayroll] 0, 1, 775

exec [payroll].[sp_Payroll_OTR_StagePayroll] 1, 1, 775



	--exec payroll.sp_Payroll_OTR_StagePayrollDriverPay 2775
	--exec payroll.sp_Payroll_OTR_StagePayrollLoad 2775



	--delete from [export].[AccountingExportPayrollData]


---------------------------------------------------------------------------------------------------------------------------------


select PaidOTRPayPeriodId, PersonId, PayrollOTRDataSourceId, *
from [export].[vAccountingExportPayrollDataCurrentPeriod] d
--where PaidOTRPayPeriodId is null
order by d.PaidOTRPayPeriodId, d.PayrollOTRDataSourceId, d.PersonId


---------------------------------------------------------------------------------------------------------------------------------






