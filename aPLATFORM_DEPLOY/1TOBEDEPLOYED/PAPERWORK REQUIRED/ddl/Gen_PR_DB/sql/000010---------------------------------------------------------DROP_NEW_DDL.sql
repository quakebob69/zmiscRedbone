USE [RedBoneThomas]
GO


--VIEWS
	DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataPastPDF]
	GO

	DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataPastPDFDetail]
	GO

	DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataPastPDFHeld]
	GO

	DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDF]
	GO

	DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFDetail]
	GO

	DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFHeld]
	GO

	DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFReleased]
	GO



	DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriod]
	GO

	DROP VIEW IF EXISTS [payroll].[vPayrollOTROpenPayPeriod]
	GO

	DROP VIEW IF EXISTS [payroll].[vPayrollOTRCurrentPayPeriod]
	GO
	
	DROP VIEW IF EXISTS [payroll].[vLoadCurrentPayPeriod]
	GO

	DROP VIEW IF EXISTS [payroll].[vLoadStopCurrentPayPeriod]
	GO

	--temp...
		DROP VIEW IF EXISTS [payroll].[vPR_OTR_History___withpersonsremoved]
		GO

		DROP VIEW IF EXISTS [payroll].[vPayrollOTRStaging___withpersonsremoved]
		GO
	
	
--USER DEFINED FUNCTIONS
	DROP FUNCTION IF EXISTS [payroll].[getLoadStopCurrentPayPeriodLoadIds]
	GO


--STORED PROCEDURES
	--'payroll' schema 
		DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_Admin_Accrual]
		GO

		DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_OTR_Accrual]
		GO
		

		---------
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodFinalize]
		GO
		
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodTotals]
		GO
									
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodValidate]
		GO
						
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodSubmitForValidation]
		GO
		
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments]
		GO
						
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords]
		GO
						
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayroll]
		GO
		
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayrollLoad]
		GO

		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayrollDriverPay]
		GO	
		
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetRecordsFromLoad]
		GO
						  
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetRecordsFromDriverPay]
		GO
				
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodReset]
		GO
				
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodOpen]
		GO
				
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGetOpen]
		GO
				
		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGetActive]	
		GO
		
		
--TABLES
	--'export' schema 
		IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollData]') AND type in (N'U'))
			DROP TABLE [export].[AccountingExportPayrollData]
		GO

		
		IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollItem]') AND type in (N'U'))
			DROP TABLE [export].[AccountingExportPayrollItem]
		GO


		IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollEntryType]') AND type in (N'U'))
			DROP TABLE [export].[AccountingExportPayrollEntryType]
		GO


		IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportCompany]') AND type in (N'U'))
			DROP TABLE [export].[AccountingExportCompany]
		GO


	--'payroll' schema
			IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRLeaveType]') AND type in (N'U'))
				ALTER TABLE [main].[Person]
				DROP CONSTRAINT [FK_Person_PayrollOTRLeaveType];

				ALTER TABLE [main].[Person]
				DROP COLUMN [PayrollOTRLeaveTypeId];

				DROP TABLE [payroll].[PayrollOTRLeaveType]
			GO

		IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRLeaveScheduled]') AND type in (N'U'))
			DROP TABLE [payroll].[PayrollOTRLeaveScheduled]
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


		IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[Holiday]') AND type in (N'U'))
			DROP TABLE [payroll].[Holiday]
		GO


		IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[main].[FY]') AND type in (N'U'))
			DROP TABLE [main].[FY]
		GO
		