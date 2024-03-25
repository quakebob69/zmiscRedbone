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


------------------------------------------------------------------------
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
				--SELECT * FROM @DriverPaidMiles;

		--EARNINGS
			DECLARE @PayrollItemEARNINGSPerDiem  VARCHAR(30)
			SET @PayrollItemEARNINGSPerDiem = 'Per Mile (Redbone - OTR)';
			DECLARE @PayrollItemEARNINGSPerDiemId INT
			SET @PayrollItemEARNINGSPerDiemId =
			(
				SELECT
				TOP 1 AccountingExportPayrollItemId 
				FROM [export].[AccountingExportPayrollItem]
				WHERE
				Name = @PayrollItemEARNINGSPerDiem
			)
				
				INSERT INTO [export].[AccountingExportPayrollData]
					(PersonId, OriginatingOTRPayPeriodId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, Quantity)
				SELECT
					dpm.PersonId, @OpenPayPeriodId, 1, @PayrollItemEARNINGSPerDiemId, dpm.DriverPaidMiles
					FROM @DriverPaidMiles dpm

		--OTHER
			DECLARE @PayrollItemOTHERPAYPerDiem  VARCHAR(10)
			SET @PayrollItemOTHERPAYPerDiem = 'Per Diem';
			DECLARE @PayrollItemOTHERPAYPerDiemId INT
			SET @PayrollItemOTHERPAYPerDiemId =
			(
				SELECT
				TOP 1 AccountingExportPayrollItemId 
				FROM [export].[AccountingExportPayrollItem]
				WHERE
				Name = @PayrollItemOTHERPAYPerDiem
			)

				INSERT INTO [export].[AccountingExportPayrollData]
					(PersonId, OriginatingOTRPayPeriodId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, Quantity)
				SELECT
					dpm.PersonId, @OpenPayPeriodId, 2, @PayrollItemOTHERPAYPerDiemId, dpm.DriverPaidMiles
					FROM @DriverPaidMiles dpm
        


------------------------------------------------------------------------
	--ASDF



GO
