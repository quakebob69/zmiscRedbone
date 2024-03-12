/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodValidate]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodValidate]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodValidate]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodValidate]
(
	@ValidationResult INT /*1=Pass, 2=Fail*/
	,@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodValidate] 1, 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	DECLARE @ChangeToStatus VARCHAR(30)
    SET @ChangeToStatus = CASE 
        WHEN @ValidationResult = 1 THEN
            'VALIDATION_PASSED'
		ELSE
            'VALIDATION_FAILED'
    END AS  VARCHAR(30)
	
	DECLARE @ActivePayPeriodId INT
	EXEC @ActivePayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy
	
	--PayrollOTRStatus
	UPDATE [payroll].[PayrollOTRPayPeriod]
	SET PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = @ChangeToStatus)
	WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId

GO
