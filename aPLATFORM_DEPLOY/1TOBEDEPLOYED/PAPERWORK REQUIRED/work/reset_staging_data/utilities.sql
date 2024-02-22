USE [RedBoneThomas]

-------
	SELECT * FROM [payroll].[PayrollOTRStaging] order by PayrollOTRStagingId desc
	SELECT COUNT(*) - 43178 FROM [dispatch].[PR_OTR_History]
	--DELETE FROM [dispatch].[PR_OTR_History] WHERE LastUpdate > '2024-02-22 09:11:49.643' AND LastUpdateBy = 2775;

-------
	--
