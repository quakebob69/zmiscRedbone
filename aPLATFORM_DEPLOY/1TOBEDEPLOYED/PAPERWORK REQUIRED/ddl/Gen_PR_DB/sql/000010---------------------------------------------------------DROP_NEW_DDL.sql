--STORED PROCEDURES
	DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_Admin_Accrual]
	GO

	
	DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_OTR_Accrual]
	GO

	
	DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayRecords__ALL_SOURCES]
	GO


	DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayRecords__Load]
	GO


	DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayRecords__DriverPay]
	GO


	DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetPayRecordsFrom__Load]
	GO


	DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetPayRecordsFrom__DriverPay]
	GO



--TABLES
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[ExportAccountingPayroll]') AND type in (N'U'))
		DROP TABLE [payroll].[ExportAccountingPayroll]
	GO
	

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPaymentHold]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRPaymentHold]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPaymentHoldReason]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRPaymentHoldReason]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollItem]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollItem]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStaging]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRStaging]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPayPeriod]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRPayPeriod]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[AccountingPayrollEntryType]') AND type in (N'U'))
		DROP TABLE [payroll].[AccountingPayrollEntryType]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRDataSource]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRDataSource]
	GO


	qb


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStatus]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRStatus]
	GO
