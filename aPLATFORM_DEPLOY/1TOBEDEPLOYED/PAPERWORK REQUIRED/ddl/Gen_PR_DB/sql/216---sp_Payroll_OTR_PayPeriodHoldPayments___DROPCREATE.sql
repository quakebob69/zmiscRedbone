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
	exec [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments] LOAD 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END


--vars
	DECLARE @DataSourceName_LOAD VARCHAR(4)
	SET @DataSourceName_LOAD = 'LOAD'
	DECLARE @PayrollOTRDataSourceId_LOAD INT
		SET @PayrollOTRDataSourceId_LOAD = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_LOAD)


	SELECT DISTINCT(stag.LoadId)
	FROM
		[payroll].[PayrollOTRStaging] stag
			JOIN
				[dispatch].[Load] ld
				ON stag.LoadId = ld.LoadId
	WHERE
		stag.PayrollOTRDataSourceId = @PayrollOTRDataSourceId_LOAD
		AND
		ld.PaperworkRecvdDate IS NULL


GO
