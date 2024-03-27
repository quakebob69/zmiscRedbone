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
	
	DECLARE @PayrollEntryOTHERPAYType VARCHAR(30)
	SET @PayrollEntryOTHERPAYType = 'OTHERPAYROLLITEMS';

	DECLARE @DataSourceName_DRIVERPAY VARCHAR(4)
	SET @DataSourceName_DRIVERPAY = 'DRIVERPAY'

	DECLARE @AccountingExportCompany VARCHAR(30)
	SET @AccountingExportCompany = 'REDBONE';

	
------------------------------------------------------------------------------------------------------------------


	--
		DECLARE @OpenPayPeriodId INT
		EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775

		DECLARE @PayrollEntryEARNINGSTypeId INT
		SET @PayrollEntryEARNINGSTypeId =
		(
			SELECT
			TOP 1 AccountingExportPayrollEntryTypeId 
			FROM [export].[AccountingExportPayrollEntryType]
			WHERE
			Name = @PayrollEntryEARNINGSType
		)

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

	--
		DECLARE @AccountingExportCompanyId INT
		SET @AccountingExportCompanyId =
		(
			SELECT
			TOP 1 AccountingExportCompanyId 
			FROM [export].[AccountingExportCompany]
			WHERE
			Name = @AccountingExportCompany
		)


--*********************************************************************************************
-- Driver Paid Miles
--*********************************************************************************************
	DECLARE @DriverPaidMiles
	TABLE (
		PersonId int NULL,
		DriverPaidMiles int NULL
	);
		
	INSERT INTO @DriverPaidMiles
		SELECT
			DriverPersonId as PersonId, ROUND(SUM(Quantity), 2) as DriverPaidMiles
		FROM
			payroll.vPayrollOTRStaging___withpersonsremoved ps
		WHERE
			PayCode = @PR_OTR_History__PayCode__PerDiem
		GROUP BY
			DriverPersonId


--=============================================================================================
-- INSERTS
--=============================================================================================
	-- Per Mile
		------------------------------------------------------------------------------------------------------------------
			DECLARE @PayrollItemEARNINGSPerDiemId INT
			SET @PayrollItemEARNINGSPerDiemId =
			(
				SELECT
				TOP 1 AccountingExportPayrollItemId 
				FROM [export].[AccountingExportPayrollItem]
				WHERE
				NameQB = @PayrollItemEARNINGSPerDiem
			)
				
				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_DRIVERPAY, @PayrollEntryEARNINGSTypeId, @PayrollItemEARNINGSPerDiemId, dpm.PersonId, dpm.DriverPaidMiles
					FROM @DriverPaidMiles dpm


	-- Per Diem
		------------------------------------------------------------------------------------------------------------------
			DECLARE @PayrollItemOTHERPAYPerDiemId INT
			SET @PayrollItemOTHERPAYPerDiemId =
			(
				SELECT
				TOP 1 AccountingExportPayrollItemId 
				FROM [export].[AccountingExportPayrollItem]
				WHERE
				NameQB = @PayrollItemOTHERPAYPerDiem
			)

				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_DRIVERPAY, @PayrollEntryOTHERPAYTypeId, @PayrollItemOTHERPAYPerDiemId, dpm.PersonId, dpm.DriverPaidMiles
					FROM @DriverPaidMiles dpm


	-- Doubles Miles
		------------------------------------------------------------------------------------------------------------------
			DECLARE @PayrollItemEARNINGSDoublesId INT
			SET @PayrollItemEARNINGSDoublesId =
			(
				SELECT
				TOP 1 AccountingExportPayrollItemId 
				FROM [export].[AccountingExportPayrollItem]
				WHERE
				PayIdLegacy = @PR_OTR_History__PayId__Doubles
			)

				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_DRIVERPAY, @PayrollEntryEARNINGSTypeId, @PayrollItemEARNINGSDoublesId, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
						FROM
						payroll.vPayrollOTRStaging___withpersonsremoved ps
						WHERE 
						PayId = @PR_OTR_History__PayId__Doubles
						GROUP BY
						ps.DriverPersonId


	-- Drop and Hook
		------------------------------------------------------------------------------------------------------------------
			DECLARE @PayrollItemEARNINGSDropNHookId INT
			SET @PayrollItemEARNINGSDropNHookId =
			(
				SELECT
				TOP 1 AccountingExportPayrollItemId 
				FROM [export].[AccountingExportPayrollItem]
				WHERE
				PayCodeLegacy = @PR_OTR_History__PayId__DropNHook
			)

				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_DRIVERPAY, @PayrollEntryEARNINGSTypeId, @PayrollItemEARNINGSDropNHookId, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
					FROM
					payroll.vPayrollOTRStaging___withpersonsremoved ps
					WHERE 
					paycode = @PR_OTR_History__PayId__DropNHook
					GROUP BY
					ps.DriverPersonId


	-- Drop Solo
		------------------------------------------------------------------------------------------------------------------
			DECLARE @PayrollItemEARNINGSDropSolo INT
			SET @PayrollItemEARNINGSDropSolo =
			(
				SELECT
				TOP 1 AccountingExportPayrollItemId 
				FROM [export].[AccountingExportPayrollItem]
				WHERE
				PayCodeLegacy = @PR_OTR_History__PayId__DropSolo
			)

				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_DRIVERPAY, @PayrollEntryEARNINGSTypeId, @PayrollItemEARNINGSDropSolo, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
					FROM
					payroll.vPayrollOTRStaging___withpersonsremoved ps
					WHERE 
					paycode = @PR_OTR_History__PayId__DropSolo
					GROUP BY
					ps.DriverPersonId


GO
