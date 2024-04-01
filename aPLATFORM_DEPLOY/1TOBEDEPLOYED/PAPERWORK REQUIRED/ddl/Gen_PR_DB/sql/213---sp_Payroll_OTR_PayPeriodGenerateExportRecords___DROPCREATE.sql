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
	@PayrollOTRDataSource varchar(15),
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords] LOAD 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END


------------------------------------------------------------------------------------------------------------------
-- WHERE
------------------------------------------------------------------------------------------------------------------
	DECLARE @PR_OTR_History__PayCode__OTHERPAY VARCHAR(12)
	SET @PR_OTR_History__PayCode__OTHERPAY = 'Other Pay';


------------------------------------------------------------------------------------------------------------------
-- VARS
------------------------------------------------------------------------------------------------------------------
	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775

	DECLARE @PayrollOTRDataSourceId INT
	SET @PayrollOTRDataSourceId = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @PayrollOTRDataSource)


------------------------------------------------------------------------------------------------------------------
-- DELETE
------------------------------------------------------------------------------------------------------------------
	DELETE FROM [export].[AccountingExportPayrollData]
	WHERE
		OriginatingOTRPayPeriodId = @OpenPayPeriodId
		AND
		PayrollOTRDataSourceId = @PayrollOTRDataSourceId;
			
			
--=============================================================================================
-- GET PAYROLL ITEMS
--=============================================================================================	
	DECLARE @PayrollRecs
	TABLE (
		PersonId int,
		AccountingExportPayrollEntryTypeId int,
		AccountingExportPayrollItemId int,
		Quantity decimal(10, 2)
	);
	

	IF @PayrollOTRDataSource = 'LOAD'
	BEGIN
		INSERT INTO @PayrollRecs
			SELECT
				DriverPersonId as PersonId, itm.AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId, ROUND(SUM(Quantity), 2) as Quantity
			FROM
				payroll.PayrollOTRStaging ps
					JOIN
						export.AccountingExportPayrollItem itm
							ON
								(ps.PayCode = itm.PayCodeLegacy
								OR
								ps.PayId = itm.PayIdLegacy)
			GROUP BY
				DriverPersonId, PayCode, AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId				
	END
	ELSE IF @PayrollOTRDataSource = 'DRIVERPAY'
	BEGIN
		INSERT INTO @PayrollRecs
			SELECT
				DriverPersonId as PersonId, itm.AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId, ROUND(SUM(TOTALPAY), 2) as Quantity
			FROM
				payroll.PayrollOTRStaging ps
					JOIN
						export.AccountingExportPayrollItem itm
							ON
								ps.PickOrigin = itm.PayCodeLegacy
			WHERE
				paycode = @PR_OTR_History__PayCode__OTHERPAY
			GROUP BY
				DriverPersonId, PayCode, AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId  			
	END


--=============================================================================================
-- INSERT
--=============================================================================================	
	INSERT INTO [export].[AccountingExportPayrollData]
		(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
	SELECT
		@OpenPayPeriodId, @PayrollOTRDataSourceId, li.AccountingExportPayrollEntryTypeId, li.AccountingExportPayrollItemId, li.PersonId, li.Quantity
	FROM @PayrollRecs li


GO
