/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriod_Open]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriod_Open]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriod_Open]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriod_Open]
AS
/*
	exec [payroll].[sp_Payroll_OTR_PayPeriod_Open]
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	DECLARE @ActivePayPeriodToOpenId INT
	
	SET @ActivePayPeriodToOpenId =
	(
		SELECT
		TOP 1 PayrollOTRPayPeriodId 
		FROM [payroll].[PayrollOTRPayPeriod]
		WHERE
		PayrollOTRStatusId = (SELECT PayrollOTRStatusId FROM [payroll].[PayrollOTRStatus] WHERE [Name] = 'NOTSTARTED')
		ORDER BY 
		FY, Number
	)
	
	UPDATE [payroll].[PayrollOTRPayPeriod]
	SET IsOpen = 1
	WHERE PayrollOTRPayPeriodId = @ActivePayPeriodToOpenId

GO
