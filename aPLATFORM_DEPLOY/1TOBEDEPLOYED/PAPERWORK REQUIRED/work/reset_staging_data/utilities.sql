USE [RedBoneThomas]

---------------------------------------------------------------------------------------------------------------------------------------------------
--================================================================
	--[sp_Payroll_OTR_StagePayRecords__DriverPay]
	--[sp_Payroll_OTR_FinalizePayPeriod]
--================================================================
	DECLARE @LastUpdateBy INT
	SET @LastUpdateBy = 2775
	---
	DECLARE @numberBeforeHistoryRecs INT
--================================================================
		-------
			exec [payroll].[sp_Payroll_OTR_PayPeriod_Open]
		-------

		-------
			SELECT 'INIT DATA AND START------------------------------------------------------------------------------------------------------------------------------'
			DELETE FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY] WHERE LastUpdate > '2024-02-22 09:11:49.643' AND LastUpdateBy = @LastUpdateBy;
			DELETE FROM [payroll].[PayrollOTRStaging];
			SET @numberBeforeHistoryRecs = (SELECT COUNT(*) AS 'NUM history RECS - START' FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY])
			SELECT COUNT(*) AS 'NUM history RECS - START' FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]
			SELECT COUNT(*) AS 'NUM staging RECS - START' FROM [payroll].[PayrollOTRStaging]
		-------	

		-------	
			SELECT 'STAGE------------------------------------------------------------------------------------------------------------------------------'
			exec [payroll].[sp_Payroll_OTR_StagePayRecords__DriverPay] @LastUpdateBy
			SELECT COUNT(*) AS 'NUM history RECS - after staging' FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]
			SELECT COUNT(*) AS 'NUM staging RECS - after staging' FROM [payroll].[PayrollOTRStaging]
		-------	

		-------
			SELECT 'FINALIZE------------------------------------------------------------------------------------------------------------------------------'
			exec [payroll].[sp_Payroll_OTR_FinalizePayPeriod] @LastUpdateBy
			SELECT COUNT(*) AS 'NUM history RECS - after finalizing' FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]
			SELECT COUNT(*) - @numberBeforeHistoryRecs AS 'NUM history ADDED' FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]
			SELECT COUNT(*) AS 'NUM staging RECS - after finalizing' FROM [payroll].[PayrollOTRStaging]
		-------	

		------
			SELECT 'INIT DATA AND END------------------------------------------------------------------------------------------------------------------------------'
			DELETE FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY] WHERE LastUpdate > '2024-02-22 09:11:49.643' AND LastUpdateBy = @LastUpdateBy;
			DELETE FROM [payroll].[PayrollOTRStaging];
			SELECT COUNT(*) AS 'NUM history RECS - END' FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]
			SELECT COUNT(*) AS 'NUM staging RECS - END' FROM [payroll].[PayrollOTRStaging]
		------
---------------------------------------------------------------------------------------------------------------------------------------------------



