/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayrollLoad]    Script Date: 2/14/2024 11:23:30 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayrollLoad]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayrollLoad]    Script Date: 2/14/2024 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_StagePayrollLoad]
(
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_StagePayrollLoad] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

--vars
	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy

	DECLARE @PayPeriodBeginDate VARCHAR(25)
	DECLARE @PayPeriodEndDate VARCHAR(25)
		SET @PayPeriodBeginDate = (SELECT FORMAT(BeginDate, 'MM/dd/yyyy') FROM payroll.PayrollOTRPayPeriod WHERE PayrollOTRPayPeriodId = @OpenPayPeriodId);
		SET @PayPeriodEndDate = (SELECT FORMAT(DATEADD(HOUR, -12, EndDate), 'MM/dd/yyyy') FROM payroll.PayrollOTRPayPeriod WHERE PayrollOTRPayPeriodId = @OpenPayPeriodId);

	DECLARE @DataSourceName_LOAD VARCHAR(4)
	SET @DataSourceName_LOAD = 'LOAD'
	DECLARE @PayrollOTRDataSourceId_LOAD INT
		SET @PayrollOTRDataSourceId_LOAD = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_LOAD)

--init tables
	DELETE FROM [payroll].[PayrollOTRStaging] WHERE
	PayrollOTRPayPeriodId = @OpenPayPeriodId
	AND
	PayrollOTRDataSourceId = @PayrollOTRDataSourceId_LOAD;

	DELETE FROM [export].[AccountingExportPayrollData] WHERE
	OriginatingOTRPayPeriodId = @OpenPayPeriodId
	AND
	OriginatingOTRPayPeriodId = @PayrollOTRDataSourceId_LOAD;

--TEMP_OTR_DATA__Load inserts
	DROP TABLE IF EXISTS #TEMP_OTR_DATA__Load
	CREATE TABLE #TEMP_OTR_DATA__Load(
		Name varchar(128) NULL,
		LoadId int NULL,
		TripNumber varchar(15) NULL,
		TruckNumber int NULL,
		Client_Id varchar(30) NULL,
		PickupBy datetime NULL,
		DeliverBy datetime NULL,
		DriverType varchar(5) NULL,
		LegInd varchar (5) NULL,
		PickOrigin varchar(128) NULL,
		DropDest varchar(128) NULL,
		DriverPersonId int NULL,
		PayCode varchar(128) NULL,
		PayId int NULL,
		Quantity decimal(10, 2) NULL,
		PayRateAmount decimal(10, 2) NULL,
		PUnitId int NULL
	)
	INSERT INTO #TEMP_OTR_DATA__Load
	EXEC [payroll].[sp_Payroll_OTR_StagePayrollLoad] @PayPeriodBeginDate, @PayPeriodEndDate

--PayrollOTRStaging inserts
	INSERT INTO payroll.PayrollOTRStaging (PayrollOTRPayPeriodId, PayrollOTRDataSourceId, Name, LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest, DriverPersonId, PayCode, PayId, Quantity, PayRateAmount, TotalPay, PayPeriodEnding,PayrollNotes,LastUpdate,LastUpdateBy,PUnitId)
		SELECT
			@OpenPayPeriodId
			,PayrollOTRDataSourceId = @PayrollOTRDataSourceId_LOAD
			,Name
			,LoadId
			,TripNumber
			,TruckNumber
			,Client_Id
			,PickupBy
			,DeliverBy
			,DriverType
			,LegInd
			,PickOrigin
			,DropDest
			,DriverPersonId
			,PayCode
			,PayId
			,Quantity
			,PayRateAmount
			,TotalPay = Quantity * PayRateAmount
			,@PayPeriodEndDate 
			,PayNotes = NULL
			,LastUpdate = GETDATE()
			,@LastUpdateBy
			,PUnitId
		FROM #TEMP_OTR_DATA__Load
GO
