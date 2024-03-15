/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodOpen]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodOpen]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodOpen]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodOpen]
(
	@LastUpdateBy INT
)
AS
/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodOpen] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	DECLARE @ChangeToStatus VARCHAR(30)
	SET @ChangeToStatus = 'STAGING'

	DECLARE @ActivePayPeriodId INT
	EXEC @ActivePayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy
	
	--table(s)
		DELETE FROM [payroll].[PayrollOTRStaging]
		
		DELETE FROM [export].[AccountingExportPayrollData]
		WHERE OriginatingOTRPayPeriodId = @ActivePayPeriodId

	--IsOpen/PayrollOTRStatus
		UPDATE [payroll].[PayrollOTRPayPeriod]
		SET IsOpen = 1, PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = @ChangeToStatus)
		WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId

GO