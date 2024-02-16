USE [RedBone]


--STORED PROCEDURES
	DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_OTR_Accrual]
	GO


	DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_Admin_Accrual]
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
	ALTER TABLE [payroll].[PayrollOTRStaging] DROP CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRPayPeriod]
	GO
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStaging]') AND type in (N'U'))
	DROP TABLE [payroll].[PayrollOTRStaging]
	GO


	ALTER TABLE [payroll].[PayrollOTRPayPeriod] DROP CONSTRAINT [FK_PayrollOTRPayPeriod_PayrollOTRStatus]
	GO
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPayPeriod]') AND type in (N'U'))
	DROP TABLE [payroll].[PayrollOTRPayPeriod]
	GO


	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStatus]') AND type in (N'U'))
	DROP TABLE [payroll].[PayrollOTRStatus]
	GO


