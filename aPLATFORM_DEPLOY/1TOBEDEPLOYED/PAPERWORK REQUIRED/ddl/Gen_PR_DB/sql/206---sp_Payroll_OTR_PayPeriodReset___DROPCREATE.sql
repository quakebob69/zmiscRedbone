/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodReset]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodReset]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodReset]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodReset]
(
	@LastUpdateBy INT
)
AS
/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodReset] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	DECLARE @ActivePayPeriodId INT
	EXEC @ActivePayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy
	
	--table(s)
		DELETE FROM [payroll].[PayrollOTRStaging]
		WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId

	--IsOpen/PayrollOTRStatus
		UPDATE [payroll].[PayrollOTRPayPeriod]
		SET IsOpen = 0, PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = 'NOTOPENED')
		WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId

GO