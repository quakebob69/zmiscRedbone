/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodOpenReset]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodOpenReset]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodOpenReset]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodOpenReset]
(
	@LastUpdateBy INT
)
AS
/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodOpenReset] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	--OpenPayPeriodId
		DECLARE @OpenPayPeriodId INT
		SET @OpenPayPeriodId =
		(
			SELECT
			TOP 1 PayrollOTRPayPeriodId 
			FROM [payroll].[PayrollOTRPayPeriod]
			WHERE
			PayrollOTRStatusId = (SELECT PayrollOTRStatusId FROM [payroll].[PayrollOTRStatus] WHERE [Name] = 'NOTSTARTED')
			ORDER BY 
			FY, Number
		)
	
	--IsOpen
		UPDATE [payroll].[PayrollOTRPayPeriod]
		SET IsOpen = 1
		WHERE PayrollOTRPayPeriodId = @OpenPayPeriodId

	--PayrollOTRStatus ('STAGING')
		UPDATE [payroll].[PayrollOTRPayPeriod]
		SET PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = 'STAGING')
		WHERE IsOpen = 1

GO