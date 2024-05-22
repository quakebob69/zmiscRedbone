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

	--VARS
		DECLARE @DataSourceName_LOAD VARCHAR(4)
		SET @DataSourceName_LOAD = 'LOAD'
		DECLARE @PayrollOTRDataSourceId_LOAD INT
			SET @PayrollOTRDataSourceId_LOAD = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_LOAD)


	--GET LOADS TO HOLD
		DECLARE @LoadsToHold TABLE ( LoadId INT )
		INSERT INTO @LoadsToHold
			SELECT
				DISTINCT(stag.LoadId)
			FROM
				[payroll].[PayrollOTRStaging] stag
					JOIN
						[dispatch].[Load] ld
						ON stag.LoadId = ld.LoadId
			WHERE
				stag.PayrollOTRDataSourceId = @PayrollOTRDataSourceId_LOAD
				AND
				ld.PaperworkRecvdDate IS NULL
			

	--ISHELD RESET
		UPDATE
			[payroll].[PayrollOTRStaging]
		SET
			isHeld = 0


	--HOLD 'LOAD' AND 'DRIVERPAY' RECORDS
		UPDATE
			[payroll].[PayrollOTRStaging]
		SET
			isHeld = 1
		WHERE
			--'LOAD'
			(LoadId in (SELECT LoadId FROM @LoadsToHold))
			--	OR
			--'DRIVERPAY'
				--???

GO