--STORED PROCEDURES
	--'payroll' schema 
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
	--'payroll' schema 
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPaymentHold]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRPaymentHold]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPaymentHoldReason]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRPaymentHoldReason]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStaging]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRStaging]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPayPeriod]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRPayPeriod]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRDataSource]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRDataSource]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStatus]') AND type in (N'U'))
		DROP TABLE [payroll].[PayrollOTRStatus]
	GO


	--'export' schema 
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[ExportAccountingPayrollData]') AND type in (N'U'))
		DROP TABLE [export].[ExportAccountingPayrollData]
	GO

	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[ExportAccountingPayrollItem]') AND type in (N'U'))
		DROP TABLE [export].[ExportAccountingPayrollItem]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[ExportAccountingPayrollEntryType]') AND type in (N'U'))
		DROP TABLE [export].[ExportAccountingPayrollEntryType]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[ExportAccountingCompany]') AND type in (N'U'))
		DROP TABLE [export].[ExportAccountingCompany]
	GO




	--'export' schema 
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[ExportAccountingPayrollData]') AND type in (N'U'))
		DROP TABLE [payroll].[ExportAccountingPayrollData]
	GO

	
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[ExportAccountingPayrollItem]') AND type in (N'U'))
		DROP TABLE [payroll].[ExportAccountingPayrollItem]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[ExportAccountingPayrollEntryType]') AND type in (N'U'))
		DROP TABLE [payroll].[ExportAccountingPayrollEntryType]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[ExportAccountingCompany]') AND type in (N'U'))
		DROP TABLE [payroll].[ExportAccountingCompany]
	GO
