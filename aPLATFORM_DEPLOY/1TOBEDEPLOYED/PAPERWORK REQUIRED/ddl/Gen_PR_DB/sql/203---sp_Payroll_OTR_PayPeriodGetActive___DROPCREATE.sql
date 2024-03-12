/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodGetActive]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGetActive]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodGetActive]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodGetActive]
(
	@LastUpdateBy INT
)
AS
/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodGetActive] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	--OpenPayPeriodId
		DECLARE @OpenPayPeriodId INT
		SET @OpenPayPeriodId =
		(
			SELECT
			TOP 1 PayrollOTRPayPeriodId 
			FROM [payroll].[PayrollOTRPayPeriod]
			WHERE
			IsActive = 1
		)
		
		RETURN @OpenPayPeriodId

GO