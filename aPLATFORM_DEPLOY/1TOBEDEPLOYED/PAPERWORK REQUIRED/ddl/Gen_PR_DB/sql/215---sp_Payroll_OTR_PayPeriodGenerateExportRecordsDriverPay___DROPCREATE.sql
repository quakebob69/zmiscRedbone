/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsDriverPay]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsDriverPay]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsDriverPay]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsDriverPay]
(
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsDriverPay] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END


------------------------------------------------------------------------------------------------------------------
-- WHERE VARS
------------------------------------------------------------------------------------------------------------------

	DECLARE @AccountingExportCompany VARCHAR(30)
	SET @AccountingExportCompany = 'REDBONE';

	DECLARE @DataSourceName_DRIVERPAY VARCHAR(10)
	SET @DataSourceName_DRIVERPAY = 'DRIVERPAY'

	DECLARE @PayrollEntryOTHERPAYType VARCHAR(25)
	SET @PayrollEntryOTHERPAYType = 'OTHERPAYROLLITEMS';

	DECLARE @PR_OTR_History__PayCode__OTHERPAY VARCHAR(12)
	SET @PR_OTR_History__PayCode__OTHERPAY = 'Other Pay';

------------------------------------------------------------------------------------------------------------------


	--
		DECLARE @OpenPayPeriodId INT
		EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775

		DECLARE @PayrollEntryOTHERPAYTypeId INT
		SET @PayrollEntryOTHERPAYTypeId =
		(
			SELECT
			TOP 1 AccountingExportPayrollEntryTypeId 
			FROM [export].[AccountingExportPayrollEntryType]
			WHERE
			Name = @PayrollEntryOTHERPAYType
		)

	--
		DECLARE @PayrollOTRDataSourceId_DRIVERPAY INT
		SET @PayrollOTRDataSourceId_DRIVERPAY = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_DRIVERPAY)

	--

		DELETE FROM [export].[AccountingExportPayrollData]
		WHERE
			OriginatingOTRPayPeriodId = @OpenPayPeriodId
			AND
			PayrollOTRDataSourceId = @PayrollOTRDataSourceId_DRIVERPAY;

		DECLARE @AccountingExportCompanyId INT
		SET @AccountingExportCompanyId =
		(
			SELECT
			TOP 1 AccountingExportCompanyId 
			FROM [export].[AccountingExportCompany]
			WHERE
			Name = @AccountingExportCompany
		)


	-- Other Pay
		------------------------------------------------------------------------------------------------------------------
			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_DRIVERPAY, @PayrollEntryOTHERPAYTypeId, itm.AccountingExportPayrollItemId, ps.DriverPersonId, ROUND(SUM(TOTALPAY), 2)
				FROM
					payroll.PayrollOTRStaging ps
						JOIN
							export.AccountingExportPayrollItem itm
								ON ps.PickOrigin = itm.PayCodeLegacy
				WHERE
					paycode = @PR_OTR_History__PayCode__OTHERPAY
				GROUP BY ps.DriverPersonId, itm.AccountingExportPayrollItemId, itm.NameQB


GO
