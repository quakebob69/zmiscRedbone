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

	--VARS
		DECLARE @PayrollOTRStatusNamePassed VARCHAR(20)
		SET @PayrollOTRStatusNamePassed = 'VALIDATION_PASSED'
		DECLARE @PayrollOTRStatusNameFailed VARCHAR(20)
		SET @PayrollOTRStatusNameFailed = 'VALIDATION_FAILED'

	--PayrollOTRStatus
		DECLARE @ChangeToStatus VARCHAR(30)
		SET @ChangeToStatus = CASE 
			WHEN @ValidationResult = 1 THEN
				@PayrollOTRStatusNamePassed
			ELSE
				@PayrollOTRStatusNameFailed
		END

	--IsDataLocked
		DECLARE @IsDataLockedVal BIT
		SET @IsDataLockedVal = CASE 
			WHEN @ValidationResult = 1 THEN
				1
			ELSE
				0
		END

	--SET PayrollOTRStatus/IsDataLocked
		DECLARE @ActivePayPeriodId INT
		EXEC @ActivePayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy
	
		UPDATE [payroll].[PayrollOTRPayPeriod]
			SET
				PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = @ChangeToStatus),
				IsDataLocked = @IsDataLockedVal
		WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId

GO
