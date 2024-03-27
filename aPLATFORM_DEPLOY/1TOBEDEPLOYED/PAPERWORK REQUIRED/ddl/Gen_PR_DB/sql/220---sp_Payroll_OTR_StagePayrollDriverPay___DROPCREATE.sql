/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayrollDriverPay]    Script Date: 2/14/2024 11:23:22 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayrollDriverPay]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayrollDriverPay]    Script Date: 2/14/2024 11:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_StagePayrollDriverPay]
(
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_StagePayrollDriverPay] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

--vars
	DECLARE @OpenPayPeriodId INT
	EXEC @OpenPayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetOpen] @LastUpdateBy

	DECLARE @PayPeriodBeginDate VARCHAR(25)
	DECLARE @PayPeriodEndDate VARCHAR(25)
		SET @PayPeriodBeginDate = (SELECT FORMAT(BeginDate, 'MM/dd/yyyy') FROM payroll.PayrollOTRPayPeriod WHERE PayrollOTRPayPeriodId = @OpenPayPeriodId);
		SET @PayPeriodEndDate = (SELECT FORMAT(DATEADD(HOUR, -12, EndDate), 'MM/dd/yyyy') FROM payroll.PayrollOTRPayPeriod WHERE PayrollOTRPayPeriodId = @OpenPayPeriodId);

	DECLARE @DataSourceName_DRIVERPAY VARCHAR(9)
	SET @DataSourceName_DRIVERPAY = 'DRIVERPAY'
	DECLARE @PayrollOTRDataSourceId_DRIVERPAY INT
		SET @PayrollOTRDataSourceId_DRIVERPAY = (SELECT PayrollOTRDataSourceId FROM payroll.PayrollOTRDataSource WHERE Name = @DataSourceName_DRIVERPAY)

--init tables
	DELETE FROM [payroll].[PayrollOTRStaging] WHERE
	PayrollOTRPayPeriodId = @OpenPayPeriodId
	AND
	PayrollOTRDataSourceId = @PayrollOTRDataSourceId_DRIVERPAY;

	DELETE FROM [export].[AccountingExportPayrollData] WHERE
	OriginatingOTRPayPeriodId = @OpenPayPeriodId
	AND
	AccountingExportPayrollData = @PayrollOTRDataSourceId_DRIVERPAY;


--TEMP_OTR_DATA__DriverPay inserts
	DROP TABLE IF EXISTS #TEMP_OTR_DATA__DriverPay
	CREATE TABLE #TEMP_OTR_DATA__DriverPay
	(
		DriverId varchar(10) NULL
		,DriverName varchar(128)
		,PayCode varchar(128)
		,PayCodeDescription varchar(128)
		,PayNotes varchar(128)
		,PayQuantity decimal(10,2)
		,PayRate decimal(10,2)
		,TotalPay decimal(10,2)
		,TripNumber varchar(15)
		,PayDate datetime
		,FirstName varchar(128)
		,DriverPersonId int
	)
	INSERT INTO #TEMP_OTR_DATA__DriverPay
	EXEC [payroll].[sp_Payroll_OTR_GetRecordsFromDriverPay] @PayPeriodBeginDate, @PayPeriodEndDate

--Table inserts
	--payroll.PayrollOTRStaging
		INSERT INTO payroll.PayrollOTRStaging (PayrollOTRPayPeriodId, PayrollOTRDataSourceId, Name, LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest, DriverPersonId, PayCode, PayId, Quantity, PayRateAmount, TotalPay, PayPeriodEnding,PayrollNotes,LastUpdate,LastUpdateBy,PUnitId)
			SELECT 
				@OpenPayPeriodId
				,PayrollOTRDataSourceId = @PayrollOTRDataSourceId_DRIVERPAY
				,Name = DriverName
				,LoadId = NULL
				,TripNumber = TripNumber
				,TruckNumber = NULL
				,Client_Id = NULL
				,PickupBy = PayDate
				,DeliverBy = PayDate
				,DriverType = NULL
				,LegInd = NULL
				,PickOrigin = PayCode
				,DropDest = PayNotes
				,DriverPersonId 
				,PayCode = 'Other Pay'
				,PayId = NULL
				,Quantity = PayQuantity	
				,PayRateAmount = PayRate
				,TotalPay = PayQuantity * PayRate
				,PayPeriodEnding = @PayPeriodEndDate
				,PayNotes
				,LastUpdate = GETDATE()
				,@LastUpdateBy
				,PUnitId = NULL
			FROM #TEMP_OTR_DATA__DriverPay
		
		--export.AccountingExportPayrollData
			EXEC [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecordsDriverPay] @LastUpdateBy
				
	--HOLD payments
		EXEC [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments] 'DriverPay', @LastUpdateBy
		
	--update pay period
		UPDATE [payroll].[PayrollOTRPayPeriod]
		SET DriverPayDataIsStaged = 1
		WHERE PayrollOTRPayPeriodId = @OpenPayPeriodId
		
GO
