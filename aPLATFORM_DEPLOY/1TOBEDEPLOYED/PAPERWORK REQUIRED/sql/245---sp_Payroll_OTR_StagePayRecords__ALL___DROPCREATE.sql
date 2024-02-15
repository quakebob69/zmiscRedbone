USE [RedBone]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayRecords__ALL]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE [payroll].[sp_Payroll_OTR_StagePayRecords__ALL]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayRecords__ALL]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [payroll].[sp_Payroll_OTR_StagePayRecords__ALL]
(
	@CurrentPayPeriodCode VARCHAR(4)
	,@LastUpdateBy Int
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_StagePayRecords__ALL] '2350', 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	exec payroll.sp_Payroll_OTR_StagePayRecords__DriverPay @CurrentPayPeriodCode, @LastUpdateBy;
	exec payroll.sp_Payroll_OTR_StagePayRecords__Load @CurrentPayPeriodCode, @LastUpdateBy;

GO


