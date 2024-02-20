/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayRecords__DriverPay]    Script Date: 2/14/2024 11:23:22 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayRecords__DriverPay]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayRecords__DriverPay]    Script Date: 2/14/2024 11:23:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_StagePayRecords__DriverPay]
(
	@CurrentPayPeriodCode VARCHAR(4)
	,@LastUpdateBy Int
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_StagePayRecords__DriverPay] '2350', 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

--vars
	DECLARE @PayrollOTRPayPeriodId int
		SET @PayrollOTRPayPeriodId = (select PayrollOTRPayPeriodId from [payroll].[PayrollOTRPayPeriod] where Code = @CurrentPayPeriodCode);

	DECLARE @PayPeriodBeginDate NVARCHAR(25)
	DECLARE @PayPeriodEndDate NVARCHAR(25)
		SET @PayPeriodBeginDate = (SELECT FORMAT(BeginDate, 'MM/dd/yyyy') FROM payroll.PayrollOTRPayPeriod WHERE Code = @CurrentPayPeriodCode);
		SET @PayPeriodEndDate = (SELECT FORMAT(DATEADD(HOUR, -12, EndDate), 'MM/dd/yyyy') FROM payroll.PayrollOTRPayPeriod WHERE Code = @CurrentPayPeriodCode);

--init tables
	--PayrollOTRPayPeriod
		UPDATE payroll.PayrollOTRPayPeriod
		SET PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = 'STAGING')
		WHERE Code = @CurrentPayPeriodCode;

	--PayrollOTRStaging
		DELETE FROM [payroll].[PayrollOTRStaging] WHERE
		PayrollOTRPayPeriodId = @PayrollOTRPayPeriodId
		AND
		isSourceDriverPay = 1;

--TEMP_OTR_DATA__DriverPay inserts
	DROP TABLE IF EXISTS #TEMP_OTR_DATA__DriverPay
	CREATE TABLE #TEMP_OTR_DATA__DriverPay
	(
		DriverId varchar(max) NULL
		,DriverName varchar(max)
		,PayCode varchar(max)
		,PayCodeDescription varchar(max)
		,PayNotes varchar(max)
		,PayQuantity decimal(10,2)
		,PayRate decimal(10,2)
		,TotalPay decimal(10,2)
		,TripNumber varchar(15)
		,PayDate datetime
		,FirstName varchar(max)
		,DriverPersonId int
	)
	INSERT INTO #TEMP_OTR_DATA__DriverPay
	EXEC payroll.sp_Payroll_OTR_GetPayRecordsFrom__DriverPay @PayPeriodBeginDate, @PayPeriodEndDate

--PayrollOTRStaging inserts
	INSERT INTO payroll.PayrollOTRStaging (PayrollOTRPayPeriodId, isSourceLoad, isSourceDriverPay, Name, LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest, DriverPersonId, PayCode, PayId, Quantity, PayRateAmount, TotalPay, PayPeriodEnding,PayrollNotes,LastUpdate,LastUpdateBy,PUnitId)
		SELECT 
			@PayrollOTRPayPeriodId
			,isSourceLoad = 0
			,isSourceDriverPay = 1
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
GO

