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

	DECLARE @PayrollEntryType VARCHAR(30)
	SET @PayrollEntryType = 'EARNINGS';

	DECLARE @PayrollEntryTypeId INT
	
	DECLARE @ActivePayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] @LastUpdateBy

	--
		ASDF = 

		QWERTY = 
	--
		DELETE FROM [export].[AccountingExportPayrollData]
			WHERE
				OriginatingOTRPayPeriodId = @OpenPayPeriodId
				AND
				AccountingExportPayrollEntryTypeId = QWERTY;

	--
		DECLARE @PayrollOTRStagingId INT
		DECLARE @PayrollOTRPayPeriodId INT
		DECLARE @PayrollOTRDataSourceId INT
		-- DECLARE @Name NVARCHAR(50)

		DECLARE @Counter INT
		SET @Counter = 1
   
		DECLARE cur CURSOR FOR
		SELECT PayrollOTRStagingId, PayrollOTRPayPeriodId, PayrollOTRDataSourceId FROM [payroll].[PayrollOTRStaging]
    
		OPEN cur
		FETCH NEXT FROM cur INTO @PayrollOTRStagingId, @PayrollOTRPayPeriodId, @PayrollOTRDataSourceId
    
		WHILE @@FETCH_STATUS = 0 AND @Counter < 3
		BEGIN
			INSERT INTO [export].[AccountingExportPayrollData]
				(PersonId, OriginatingOTRPayPeriodId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId)
			VALUES
				(2775, @PayrollOTRPayPeriodId, @Counter, @Counter)
        
			SET @Counter = @Counter + 1
			FETCH NEXT FROM cur INTO @PayrollOTRStagingId, @PayrollOTRPayPeriodId, @PayrollOTRDataSourceId
		END
    
		CLOSE cur
		DEALLOCATE cur

GO
