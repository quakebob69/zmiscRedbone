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
-- WHERE VARS
------------------------------------------------------------------------------------------------------------------

	DECLARE @AccountingExportCompany VARCHAR(30)
	SET @AccountingExportCompany = 'REDBONE';

	DECLARE @DataSourceName_LOAD VARCHAR(4)
	SET @DataSourceName_LOAD = 'LOAD'

	DECLARE @PayrollEntryEARNINGSType VARCHAR(30)
	SET @PayrollEntryEARNINGSType = 'EARNINGS';

	DECLARE @PayrollEntryOTHERPAYType VARCHAR(30)
	SET @PayrollEntryOTHERPAYType = 'OTHERPAYROLLITEMS';

	--
		DECLARE @PR_OTR_History__PayCode__PerDiem VARCHAR(8)
		SET @PR_OTR_History__PayCode__PerDiem = 'Per Diem';

		DECLARE @PR_OTR_History__PayId__Doubles INT
		SET @PR_OTR_History__PayId__Doubles = 76;

		DECLARE @PR_OTR_History__PayCode__DropNHook VARCHAR(25)
		SET @PR_OTR_History__PayCode__DropNHook = 'Drop & Hook';

		DECLARE @PR_OTR_History__PayCode__DropSolo VARCHAR(25)
		SET @PR_OTR_History__PayCode__DropSolo = 'Extra Stops';
		
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
		DECLARE @PayrollOTRDataSourceId_LOAD INT
		SET @PayrollOTRDataSourceId_LOAD = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_LOAD)

	--
		DELETE FROM [export].[AccountingExportPayrollData]
		WHERE
			OriginatingOTRPayPeriodId = @OpenPayPeriodId
			AND
			PayrollOTRDataSourceId = @PayrollOTRDataSourceId_LOAD;

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
	-- INSERTS
	--=============================================================================================	
	INSERT INTO [export].[AccountingExportPayrollData]
		(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
	SELECT
		@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, li.AccountingExportPayrollEntryTypeId, li.AccountingExportPayrollItemId, li.PersonId, li.Quantity
	FROM @LoadsItems li












/*
--=============================================================================================
-- INSERTS
--=============================================================================================
	-- Per Mile
		------------------------------------------------------------------------------------------------------------------				
			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryEARNINGSTypeId, asdf, li.PersonId, li.DriverPaidMiles
				FROM @LoadsItems li


	-- Per Diem
		------------------------------------------------------------------------------------------------------------------
			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryOTHERPAYTypeId, asdf, li.PersonId, li.DriverPaidMiles
				FROM @LoadsItems li


	-- Doubles Miles
		------------------------------------------------------------------------------------------------------------------
			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryEARNINGSTypeId, itm.AccountingExportPayrollItemId, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
				FROM
					payroll.PayrollOTRStaging ps
						JOIN
							export.AccountingExportPayrollItem itm
								ON ps.PayId = itm.PayIdLegacy
				WHERE 
				PayId = @PR_OTR_History__PayId__Doubles
				GROUP BY
				itm.AccountingExportPayrollItemId, ps.DriverPersonId


	-- Drop and Hook
		------------------------------------------------------------------------------------------------------------------
			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryEARNINGSTypeId, itm.AccountingExportPayrollItemId, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
				FROM
					payroll.PayrollOTRStaging ps
						JOIN
							export.AccountingExportPayrollItem itm
								ON ps.PayCode = itm.PayCodeLegacy
				WHERE 
				paycode = @PR_OTR_History__PayCode__DropNHook
				GROUP BY
				itm.AccountingExportPayrollItemId, ps.DriverPersonId


	-- Drop Solo
		------------------------------------------------------------------------------------------------------------------
			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryEARNINGSTypeId, itm.AccountingExportPayrollItemId, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
				FROM
					payroll.PayrollOTRStaging ps
						JOIN
							export.AccountingExportPayrollItem itm
								ON ps.PayCode = itm.PayCodeLegacy
				WHERE 
				paycode = @PR_OTR_History__PayCode__DropSolo
				GROUP BY
				itm.AccountingExportPayrollItemId, ps.DriverPersonId
*/

GO
