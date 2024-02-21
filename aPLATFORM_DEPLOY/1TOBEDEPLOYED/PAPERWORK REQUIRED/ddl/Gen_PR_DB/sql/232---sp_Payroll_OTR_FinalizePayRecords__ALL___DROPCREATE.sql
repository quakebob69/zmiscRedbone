/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_FinalizePayRecords__ALL_SOURCES]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_FinalizePayRecords__ALL_SOURCES]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_FinalizePayRecords__ALL_SOURCES]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [payroll].[sp_Payroll_OTR_FinalizePayRecords__ALL_SOURCES]
(
	@CurrentPayPeriodCode VARCHAR(4)
	,@LastUpdateBy Int
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_FinalizePayRecords__ALL_SOURCES] '2350', 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	exec payroll.sp_Payroll_OTR_FinalizePayRecords__DriverPay @CurrentPayPeriodCode, @LastUpdateBy;
	exec payroll.sp_Payroll_OTR_FinalizePayRecords__Load @CurrentPayPeriodCode, @LastUpdateBy;

GO


