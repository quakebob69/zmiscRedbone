/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments]
(
	@PayrollOTRDataSource varchar(15),
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	--

GO
