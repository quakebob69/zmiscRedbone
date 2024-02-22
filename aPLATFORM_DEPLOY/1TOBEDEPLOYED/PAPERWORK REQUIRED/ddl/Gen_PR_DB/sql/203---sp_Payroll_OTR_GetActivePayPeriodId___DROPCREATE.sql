/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetActivePayPeriodId]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetActivePayPeriodId]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetActivePayPeriodId]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_GetActivePayPeriodId]
AS
/*
	exec [payroll].[sp_Payroll_OTR_GetActivePayPeriodId]
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	DECLARE @PayrollOTRStatusName_NotStarted VARCHAR(20)
	SET @PayrollOTRStatusName_NotStarted = 'NOTSTARTED'
	DECLARE @PayrollOTRStatusId_NotStarted INT
	SET @PayrollOTRStatusId_NotStarted = (SELECT PayrollOTRStatusId FROM [payroll].[PayrollOTRStatus] WHERE [Name] = @PayrollOTRStatusName_NotStarted)

	SELECT
	TOP 1 PayrollOTRPayPeriodId 
	FROM [payroll].[PayrollOTRPayPeriod]
	WHERE
	PayrollOTRStatusId = @PayrollOTRStatusId_NotStarted
	ORDER BY 
	FY DESC, Number

GO
