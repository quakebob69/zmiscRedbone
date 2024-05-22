/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodUnHoldPayments]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodUnHoldPayments]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodUnHoldPayments]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodUnHoldPayments]
(
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodUnHoldPayments] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	--VARS
		DECLARE @ActivePayPeriodId INT
		EXEC @ActivePayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy

		DECLARE @DataSourceName_LOAD VARCHAR(4)
		SET @DataSourceName_LOAD = 'LOAD'
		DECLARE @PayrollOTRDataSourceId_LOAD INT
			SET @PayrollOTRDataSourceId_LOAD = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_LOAD)

	--UNHOLD
		UPDATE
			[export].[AccountingExportPayrollData] 
		SET
			PayPeriodId = @ActivePayPeriodId
		WHERE
			AccountingExportPayrollDataId
				IN
					(
					SELECT
						aepd.AccountingExportPayrollDataId
					FROM
						[export].[AccountingExportPayrollData] aepd
						JOIN [dispatch].[load] ld on aepd.LoadIdOrDriverPayId = ld.loadid
					WHERE
						PayPeriodId is null
						AND
						ld.PaperworkRecvdDate is not null
						AND
						aepd.PayrollOTRDataSourceId = @PayrollOTRDataSourceId_LOAD
					)

GO