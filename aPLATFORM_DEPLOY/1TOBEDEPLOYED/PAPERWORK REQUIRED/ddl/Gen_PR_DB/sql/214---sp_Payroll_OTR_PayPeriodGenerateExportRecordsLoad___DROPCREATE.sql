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

		DECLARE @PayrollEntryType VARCHAR(30)
		SET @PayrollEntryType = 'EARNINGS';
		DECLARE @PayrollEntryTypeId INT
		SET @PayrollEntryTypeId =
		(
			SELECT
			TOP 1 AccountingExportPayrollEntryTypeId 
			FROM [export].[AccountingExportPayrollEntryType]
			WHERE
			Name = @PayrollEntryType
		)


	--
		DELETE FROM [export].[AccountingExportPayrollData]
		WHERE
			OriginatingOTRPayPeriodId = @OpenPayPeriodId
			AND
			AccountingExportPayrollEntryTypeId = @PayrollEntryTypeId;


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
















--------------------------------------------------------------------------------------------------------------------------
--DriverPaidMiles
--------------------------------------------------------------------------------------------------------------------------	
	--'Per Diem' Pay Code
		DECLARE @PerDiemPayCode VARCHAR(8)
		SET @PerDiemPayCode = 'Per Diem';

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
				PayCode = @PerDiemPayCode
			GROUP BY
				DriverPersonId
			--ORDER BY pm.PersonId
			;
			SELECT * FROM @DriverPaidMiles;


--------------------------------------------------------------------------------------------------------------------------
--#QuickBooksData INSERTS
--------------------------------------------------------------------------------------------------------------------------
	-- #QuickBooksData
		DROP TABLE IF EXISTS #QuickBooksData;
		CREATE TABLE #QuickBooksData
		(
			personId INT,
			entryType VARCHAR(50),
			itemName VARCHAR(50),
			quantity INT,
			otherPayrollItemsPay decimal(18,2),
			PickOrigin VARCHAR(25),
			PayId INT,
			PayCode VARCHAR(25)
		);




	
/*
	SELECT TOP (1000) [AccountingExportPayrollDataId]
		  ,[PersonId]
		  ,[OriginatingOTRPayPeriodId]
		  ,[AccountingExportPayrollEntryTypeId]
		  ,[AccountingExportPayrollItemId]
		  ,[Quantity]
		  ,[Rate]
		  ,[PayrollOTRPaymentHoldReasonId]
		  ,[HeldPaymentHasBeenPaid]
	  FROM [RedBoneThomas].[export].[AccountingExportPayrollData]
*/


INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Per Mile (Redbone - Dedicated)', 1);









		PayrollItemasdf
		PayrollItemasdfId

		INSERT INTO [export].[AccountingExportPayrollData]
			(PersonId, OriginatingOTRPayPeriodId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId)
		SELECT dpm.PersonId, @OpenPayPeriodId, @PayrollEntryTypeId, dpm.DriverPaidMiles, 1
			FROM @DriverPaidMiles dpm
        


	--Driver Paid Miles (@@DriverPaidMiles)
		DECLARE @QBITEMNAME_PERMILEOTR VARCHAR(25)
		SET @QBITEMNAME_PERMILEOTR = 'Per Mile (Redbone - OTR)';


		INSERT INTO #QuickBooksData (personId, entryType, itemName, quantity, otherPayrollItemsPay, PickOrigin, PayId, PayCode)
			SELECT dpm.PersonId, @QBENTRYTYPE_EARNINGS, @QBITEMNAME_PERMILEOTR, dpm.DriverPaidMiles, NULL, NULL, NULL, @PerDiemPayCode
			FROM @DriverPaidMiles dpm
		;




















GO
