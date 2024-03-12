/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodSubmitForValidation]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodSubmitForValidation]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodSubmitForValidation]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodSubmitForValidation]
(
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodSubmitForValidation] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	DECLARE @ActivePayPeriodId INT
	EXEC @ActivePayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy
	
	--PayrollOTRStatus
		UPDATE [payroll].[PayrollOTRPayPeriod]
		SET PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = 'VALIDATING')
		WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId

GO
