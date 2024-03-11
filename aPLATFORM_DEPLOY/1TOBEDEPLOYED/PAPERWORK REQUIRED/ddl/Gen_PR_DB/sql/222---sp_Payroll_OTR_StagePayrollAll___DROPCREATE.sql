/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayrollAll]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayrollAll]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayrollAll]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_StagePayrollAll]
(
	@LastUpdateBy Int
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_StagePayrollAll] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	exec payroll.sp_Payroll_OTR_StagePayrollDriverPay @LastUpdateBy;
	exec payroll.sp_Payroll_OTR_StagePayrollLoad @LastUpdateBy;

GO


