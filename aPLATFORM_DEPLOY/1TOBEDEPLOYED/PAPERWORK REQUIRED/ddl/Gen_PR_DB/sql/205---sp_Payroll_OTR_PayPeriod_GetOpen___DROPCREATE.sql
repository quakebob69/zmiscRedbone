/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriod_GetOpen]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriod_GetOpen]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriod_GetOpen]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriod_GetOpen]
AS
/*
	exec [payroll].[sp_Payroll_OTR_PayPeriod_GetOpen]
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	DECLARE @ActivePayPeriodId INT
	SET @ActivePayPeriodId =
	(
		SELECT TOP 1 PayrollOTRPayPeriodId FROM [payroll].[PayrollOTRPayPeriod]
		WHERE IsOpen = 1
	)
    RETURN @ActivePayPeriodId	

GO
