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
	exec [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords] 'Load', 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END
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
    
    WHILE @@FETCH_STATUS = 0
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
