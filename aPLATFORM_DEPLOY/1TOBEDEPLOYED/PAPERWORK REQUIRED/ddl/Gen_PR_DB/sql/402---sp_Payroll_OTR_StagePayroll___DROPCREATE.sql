/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayroll]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayroll]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayroll]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_StagePayroll]
(
	@OnlyGetDriverPayData BIT,
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_StagePayroll] 0, 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	--VARS
		DECLARE @OpenPayPeriodId INT
		EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] @LastUpdateBy


	--STAGE
		--GET DATA
			--DriverPay
			exec payroll.sp_Payroll_OTR_StagePayrollDriverPay @LastUpdateBy;
			
			--LOAD
			IF @OnlyGetDriverPayData = 0
			BEGIN
				exec payroll.sp_Payroll_OTR_StagePayrollLoad @LastUpdateBy;			
			END
			

		--AccountingExportPayrollData
			EXEC [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords] @LastUpdateBy
				
				
		--HOLD
			EXEC [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments] @LastUpdateBy		
			

		--PAY PERIOD
			UPDATE [payroll].[PayrollOTRPayPeriod]
			SET IsDataStaged = 1
			WHERE PayrollOTRPayPeriodId = @OpenPayPeriodId

GO


