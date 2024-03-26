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

	--
		DECLARE @OpenPayPeriodId INT
		EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] 2775

		DECLARE @PayrollEntryEARNINGSType VARCHAR(30)
		SET @PayrollEntryEARNINGSType = 'EARNINGS';
		DECLARE @PayrollEntryEARNINGSTypeId INT
		SET @PayrollEntryEARNINGSTypeId =
		(
			SELECT
			TOP 1 AccountingExportPayrollEntryTypeId 
			FROM [export].[AccountingExportPayrollEntryType]
			WHERE
			Name = @PayrollEntryEARNINGSType
		)

		DECLARE @PayrollEntryOTHERPAYType VARCHAR(30)
		SET @PayrollEntryOTHERPAYType = 'OTHERPAYROLLITEMS';
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
		DECLARE @DataSourceName_LOAD VARCHAR(4)
		SET @DataSourceName_LOAD = 'LOAD'
		DECLARE @PayrollOTRDataSourceId_LOAD INT
		SET @PayrollOTRDataSourceId_LOAD = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_LOAD)

	--
		DELETE FROM [export].[AccountingExportPayrollData]
		WHERE
			OriginatingOTRPayPeriodId = @OpenPayPeriodId
			AND
			PayrollOTRDataSourceId = @PayrollOTRDataSourceId_LOAD;

	--
		DECLARE @AccountingExportCompany VARCHAR(30)
		SET @AccountingExportCompany = 'REDBONE';
		DECLARE @AccountingExportCompanyId INT
		SET @AccountingExportCompanyId =
		(
			SELECT
			TOP 1 AccountingExportCompanyId 
			FROM [export].[AccountingExportCompany]
			WHERE
			Name = @AccountingExportCompany
		)


	 --Driver Paid Miles
		--'Per Diem' Pay Code
			DECLARE @PR_OTR_History__PayCode__PerDiem VARCHAR(8)
			SET @PR_OTR_History__PayCode__PerDiem = 'Per Diem';

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
			;

/*
--1) Per Mile (Redbone - OTR)
	------------------------------------------------------------------------------------------------------------------
		DECLARE @PayrollItemEARNINGSPerDiem  VARCHAR(30)
		SET @PayrollItemEARNINGSPerDiem = 'Per Mile (Redbone - OTR)';
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
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryEARNINGSTypeId, @PayrollItemEARNINGSPerDiemId, dpm.PersonId, dpm.DriverPaidMiles
				FROM @DriverPaidMiles dpm


--2) Per Diem
	------------------------------------------------------------------------------------------------------------------
		DECLARE @PayrollItemOTHERPAYPerDiem  VARCHAR(10)
		SET @PayrollItemOTHERPAYPerDiem = 'Per Diem';
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
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryOTHERPAYTypeId, @PayrollItemOTHERPAYPerDiemId, dpm.PersonId, dpm.DriverPaidMiles
				FROM @DriverPaidMiles dpm


--3) Doubles (Albertsons)
	------------------------------------------------------------------------------------------------------------------
		DECLARE @PayrollItemEARNINGSDoubles  VARCHAR(30)
		SET @PayrollItemEARNINGSDoubles = 'Doubles (Albertsons)';
		DECLARE @PayrollItemEARNINGSDoublesId INT
		SET @PayrollItemEARNINGSDoublesId =
		(
			SELECT
			TOP 1 AccountingExportPayrollItemId 
			FROM [export].[AccountingExportPayrollItem]
			WHERE
			NameQB = @PayrollItemEARNINGSDoubles
		)

		DECLARE @PR_OTR_History__PayId__Doubles INT
		SET @PR_OTR_History__PayId__Doubles = 76;

			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryEARNINGSTypeId, @PayrollItemEARNINGSDoublesId, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
					FROM
					payroll.vPayrollOTRStaging___withpersonsremoved ps
					WHERE 
					PayId = @PR_OTR_History__PayId__Doubles
					GROUP BY
					ps.DriverPersonId
*/


--4) Drop & Hook (Doubles)
	------------------------------------------------------------------------------------------------------------------
		DECLARE @PR_OTR_History__PayId__DropNHook VARCHAR(25)
		SET @PR_OTR_History__PayId__DropNHook = 'Drop & Hook';



		DECLARE @PayrollItemEARNINGSDropNHookId INT
		SET @PayrollItemEARNINGSDropNHookId =
		(
			SELECT
			TOP 1 AccountingExportPayrollItemId 
			FROM [export].[AccountingExportPayrollItem]
			WHERE
			NameLegacy = @PR_OTR_History__PayId__DropNHook
		)

			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryEARNINGSTypeId, @PayrollItemEARNINGSDropNHookId, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
				FROM
				payroll.vPayrollOTRStaging___withpersonsremoved ps
				WHERE 
				paycode = @PR_OTR_History__PayId__DropNHook
				GROUP BY
				ps.DriverPersonId












/*
		DECLARE @PayrollItemEARNINGSDropNHook  VARCHAR(30)
		SET @PayrollItemEARNINGSDropNHook = 'Drop & Hook (Doubles)';
		DECLARE @PayrollItemEARNINGSDropNHookId INT
		SET @PayrollItemEARNINGSDropNHookId =
		(
			SELECT
			TOP 1 AccountingExportPayrollItemId 
			FROM [export].[AccountingExportPayrollItem]
			WHERE
			NameQB = @PayrollItemEARNINGSDropNHook
		)

		DECLARE @PR_OTR_History__PayId__DropNHook VARCHAR(25)
		SET @PR_OTR_History__PayId__DropNHook = 'Drop & Hook';

			INSERT INTO [export].[AccountingExportPayrollData]
				(OriginatingOTRPayPeriodId, PayrollOTRDataSourceId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PersonId, Quantity)
			SELECT
				@OpenPayPeriodId, @PayrollOTRDataSourceId_LOAD, @PayrollEntryEARNINGSTypeId, @PayrollItemEARNINGSDropNHookId, ps.DriverPersonId, ROUND(SUM(Quantity), 2)
				FROM
				payroll.vPayrollOTRStaging___withpersonsremoved ps
				WHERE 
				paycode = @PR_OTR_History__PayId__DropNHook
				GROUP BY
				ps.DriverPersonId
*/











/*
    -- Declare variables to hold the values of the columns
    DECLARE @Column1Value INT
    DECLARE @Column2Value VARCHAR(50)
    DECLARE @Column3Value DATETIME

    -- Get the row from the table
    SELECT TOP 1 @Column1Value = Column1, @Column2Value = Column2, @Column3Value = Column3
    FROM MyTable
    WHERE Column1 = 'SomeValue'

    -- Assign the values to the variables
    SET @Column1Value = @Column1Value
    SET @Column2Value = @Column2Value
    SET @Column3Value = @Column3Value



	'Drop & Hook (Doubles)'
	'OTR Drop Solo'
	'Per Mile (Trainee)'
	'Per Mile (Trainer)'
*/
GO
