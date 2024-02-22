USE [RedBoneThomas]

---------------------------------------------------------------------------------------------------------------------------------------------------
--================================================================
	--[sp_Payroll_OTR_StagePayRecords__DriverPay]
	--[sp_Payroll_OTR_FinalizePayPeriod]
--================================================================
	DECLARE @LastUpdateBy INT
	SET @LastUpdateBy = 2775
	DECLARE @payperiod NVARCHAR(25)
	SET @payperiod = '2350'
	DECLARE @numberBeforeHistoryRecs INT
--================================================================
		-------
			SELECT 'INIT DATA AND START------------------------------------------------------------------------------------------------------------------------------'
			DELETE FROM [dispatch].[PR_OTR_History] WHERE LastUpdate > '2024-02-22 09:11:49.643' AND LastUpdateBy = @LastUpdateBy;
			DELETE FROM [payroll].[PayrollOTRStaging];
			SET @numberBeforeHistoryRecs = (SELECT COUNT(*) AS 'NUM history RECS - START' FROM [dispatch].[PR_OTR_History])
			SELECT COUNT(*) AS 'NUM history RECS - START' FROM [dispatch].[PR_OTR_History]
			SELECT COUNT(*) AS 'NUM staging RECS - START' FROM [payroll].[PayrollOTRStaging]
		-------	

		-------	
			SELECT 'STAGE------------------------------------------------------------------------------------------------------------------------------'
			exec [payroll].[sp_Payroll_OTR_StagePayRecords__DriverPay] @payperiod, @LastUpdateBy
			SELECT COUNT(*) AS 'NUM history RECS - after staging' FROM [dispatch].[PR_OTR_History]
			SELECT COUNT(*) AS 'NUM staging RECS - after staging' FROM [payroll].[PayrollOTRStaging]
		-------	

		-------
			SELECT 'FINALIZE------------------------------------------------------------------------------------------------------------------------------'
			exec [payroll].[sp_Payroll_OTR_FinalizePayPeriod] @payperiod, @LastUpdateBy
			SELECT COUNT(*) AS 'NUM history RECS - after finalizing' FROM [dispatch].[PR_OTR_History]
			SELECT COUNT(*) - @numberBeforeHistoryRecs AS 'NUM history ADDED' FROM [dispatch].[PR_OTR_History]
			SELECT COUNT(*) AS 'NUM staging RECS - after finalizing' FROM [payroll].[PayrollOTRStaging]
		-------	

		------
			SELECT 'INIT DATA AND END------------------------------------------------------------------------------------------------------------------------------'
			DELETE FROM [dispatch].[PR_OTR_History] WHERE LastUpdate > '2024-02-22 09:11:49.643' AND LastUpdateBy = @LastUpdateBy;
			DELETE FROM [payroll].[PayrollOTRStaging];
			SELECT COUNT(*) AS 'NUM history RECS - END' FROM [dispatch].[PR_OTR_History]
			SELECT COUNT(*) AS 'NUM staging RECS - END' FROM [payroll].[PayrollOTRStaging]
		------
---------------------------------------------------------------------------------------------------------------------------------------------------



