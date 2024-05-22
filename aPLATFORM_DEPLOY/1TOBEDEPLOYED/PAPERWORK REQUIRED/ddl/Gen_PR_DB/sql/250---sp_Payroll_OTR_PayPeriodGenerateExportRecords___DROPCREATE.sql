/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords]
(
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END


------------------------------------------------------------------------------------------------------------------
-- VARS
------------------------------------------------------------------------------------------------------------------
	DECLARE @PR_OTR_History__PayCode__OTHERPAY VARCHAR(12)
	SET @PR_OTR_History__PayCode__OTHERPAY = 'Other Pay';

	DECLARE @DataSourceName_LOAD VARCHAR(4)
	SET @DataSourceName_LOAD = 'LOAD'
	DECLARE @PayrollOTRDataSourceId_LOAD INT
		SET @PayrollOTRDataSourceId_LOAD = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_LOAD)

	DECLARE @DataSourceName_DRIVERPAY VARCHAR(9)
	SET @DataSourceName_DRIVERPAY = 'DRIVERPAY'
	DECLARE @PayrollOTRDataSourceId_DRIVERPAY INT
		SET @PayrollOTRDataSourceId_DRIVERPAY = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_DRIVERPAY)

	DECLARE @PaymentHoldReason_INCOMPLETELOADPAPERWORK VARCHAR(9)
	SET @PaymentHoldReason_INCOMPLETELOADPAPERWORK = 'INCOMPLETELOADPAPERWORK'
	DECLARE @PaymentHoldReason_INCOMPLETELOADPAPERWORK_ID INT
		SET @PaymentHoldReason_INCOMPLETELOADPAPERWORK_ID = (SELECT PayrollOTRPaymentHoldReasonId FROM payroll.PayrollOTRPaymentHoldReason WHERE Name = @PaymentHoldReason_INCOMPLETELOADPAPERWORK)

	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775


------------------------------------------------------------------------------------------------------------------
-- DELETE
------------------------------------------------------------------------------------------------------------------
	DELETE FROM [export].[AccountingExportPayrollData]
	WHERE
		OriginatingOTRPayPeriodId = @OpenPayPeriodId
			
			
--=============================================================================================
--INSERT
--=============================================================================================	
	--LOAD
		--TEMP TABLE
			DECLARE @PayrollRecs__LOAD
			TABLE (
				PersonId int,
				AccountingExportPayrollEntryTypeId int,
				AccountingExportPayrollItemId int,
				LoadId int,
				IsHeld bit,
				Quantity decimal(10, 2)
			);

		--GET RECORDS
			INSERT INTO @PayrollRecs__LOAD
				SELECT
					DriverPersonId as PersonId, itm.AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId, LoadId, IsHeld, ROUND(SUM(Quantity), 2) as Quantity
				FROM
					payroll.PayrollOTRStaging ps
						JOIN
							export.AccountingExportPayrollItem itm
								ON
									(ps.PayCode = itm.PayCodeLegacy
									OR
									ps.PayId = itm.PayIdLegacy)
				GROUP BY
					DriverPersonId, PayCode, AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId, LoadId, IsHeld
					
		--INSERT
			--HELD
				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, LoadIdOrDriverPayId, Quantity, PayrollOTRPaymentHoldReasonId)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, recs.AccountingExportPayrollEntryTypeId, recs.AccountingExportPayrollItemId, recs.PersonId, recs.LoadId, recs.Quantity, @PayrollOTRDataSourceId_DRIVERPAY
				FROM @PayrollRecs__LOAD recs
				WHERE IsHeld = 1;

			--NOT HELD
				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, LoadIdOrDriverPayId, Quantity,
						PayPeriodId)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, recs.AccountingExportPayrollEntryTypeId, recs.AccountingExportPayrollItemId, recs.PersonId, recs.LoadId, recs.Quantity,
						@OpenPayPeriodId
				FROM @PayrollRecs__LOAD recs
				WHERE IsHeld = 0;


	--DRIVERPAY
		--TEMP TABLE
			DECLARE @PayrollRecs__DRIVERPAY
			TABLE (
				PersonId int,
				AccountingExportPayrollEntryTypeId int,
				AccountingExportPayrollItemId int,
				DriverPayId int,
				IsHeld bit,
				Quantity decimal(10, 2)
			);

		--GET RECORDS
			INSERT INTO @PayrollRecs__DRIVERPAY
				SELECT
					DriverPersonId as PersonId, itm.AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId, DriverPayId, IsHeld, ROUND(SUM(TOTALPAY), 2) as Quantity
				FROM
					payroll.PayrollOTRStaging ps
						JOIN
							export.AccountingExportPayrollItem itm
								ON
									ps.PickOrigin = itm.PayCodeLegacy
				WHERE
					paycode = @PR_OTR_History__PayCode__OTHERPAY
				GROUP BY
					DriverPersonId, PayCode, AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId, DriverPayId, IsHeld
					
		--INSERT
			--HELD
				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, LoadIdOrDriverPayId, Quantity, PayrollOTRPaymentHoldReasonId)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_DRIVERPAY, recs.AccountingExportPayrollEntryTypeId, recs.AccountingExportPayrollItemId, recs.PersonId, recs.DriverPayId, recs.Quantity, @PayrollOTRDataSourceId_DRIVERPAY
				FROM @PayrollRecs__DRIVERPAY recs
				WHERE IsHeld = 1;

			--NOT HELD
				INSERT INTO [export].[AccountingExportPayrollData]
					(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, LoadIdOrDriverPayId, Quantity,
						PayPeriodId)
				SELECT
					@OpenPayPeriodId, @PayrollOTRDataSourceId_DRIVERPAY, recs.AccountingExportPayrollEntryTypeId, recs.AccountingExportPayrollItemId, recs.PersonId, recs.DriverPayId, recs.Quantity,
						@OpenPayPeriodId
				FROM @PayrollRecs__DRIVERPAY recs
				WHERE IsHeld = 0;

GO
