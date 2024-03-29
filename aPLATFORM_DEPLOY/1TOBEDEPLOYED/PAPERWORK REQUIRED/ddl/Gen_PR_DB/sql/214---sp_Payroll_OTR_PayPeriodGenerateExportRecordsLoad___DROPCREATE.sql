/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsLoad]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsLoad]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsLoad]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsLoad]
(
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsLoad] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END


------------------------------------------------------------------------------------------------------------------
-- WHERE
------------------------------------------------------------------------------------------------------------------
	DECLARE @DataSourceName_LOAD VARCHAR(4)
	SET @DataSourceName_LOAD = 'LOAD'


------------------------------------------------------------------------------------------------------------------
-- VARS
------------------------------------------------------------------------------------------------------------------
	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775

	DECLARE @PayrollOTRDataSourceId_LOAD INT
	SET @PayrollOTRDataSourceId_LOAD = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_LOAD)


------------------------------------------------------------------------------------------------------------------
-- DELETE
------------------------------------------------------------------------------------------------------------------
	DELETE FROM [export].[AccountingExportPayrollData]
	WHERE
		OriginatingOTRPayPeriodId = @OpenPayPeriodId
		AND
		PayrollOTRDataSourceId = @PayrollOTRDataSourceId_LOAD;
			
			
--=============================================================================================
-- Payroll Items from Loads
--=============================================================================================	
	DECLARE @LoadsItems
	TABLE (
		PersonId int,
		AccountingExportPayrollEntryTypeId int,
		AccountingExportPayrollItemId int,
		Quantity decimal(10, 2)
	);
	
	INSERT INTO @LoadsItems
		SELECT
			DriverPersonId as PersonId, itm.AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId, ROUND(SUM(Quantity), 2) as Quantity
		FROM
			payroll.PayrollOTRStaging ps
				JOIN
					export.AccountingExportPayrollItem itm
						ON 
						ps.PayCode = itm.PayCodeLegacy
						OR 
						ps.PayId = itm.PayIdLegacy
		GROUP BY
			DriverPersonId, PayCode, AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId


--=============================================================================================
-- INSERT
--=============================================================================================	
	INSERT INTO [export].[AccountingExportPayrollData]
		(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
	SELECT
		@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, li.AccountingExportPayrollEntryTypeId, li.AccountingExportPayrollItemId, li.PersonId, li.Quantity
	FROM @LoadsItems li


GO
