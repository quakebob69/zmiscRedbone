/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayRecords__Load]    Script Date: 2/14/2024 11:23:30 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayRecords__Load]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_StagePayRecords__Load]    Script Date: 2/14/2024 11:23:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_StagePayRecords__Load]
(
	@CurrentPayPeriodCode VARCHAR(4)
	,@LastUpdateBy Int
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_StagePayRecords__Load] '2350', 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

--vars
	DECLARE @PayrollOTRPayPeriodId int
		SET @PayrollOTRPayPeriodId = (select PayrollOTRPayPeriodId from payroll.PayrollOTRPayPeriod where Code = @CurrentPayPeriodCode);

	DECLARE @PayPeriodBeginDate NVARCHAR(25)
	DECLARE @PayPeriodEndDate NVARCHAR(25)
		SET @PayPeriodBeginDate = (SELECT FORMAT(BeginDate, 'MM/dd/yyyy') FROM payroll.PayrollOTRPayPeriod WHERE Code = @CurrentPayPeriodCode);
		SET @PayPeriodEndDate = (SELECT FORMAT(DATEADD(HOUR, -12, EndDate), 'MM/dd/yyyy') FROM payroll.PayrollOTRPayPeriod WHERE Code = @CurrentPayPeriodCode);

--init tables
	--PayrollOTRPayPeriod
		UPDATE payroll.PayrollOTRPayPeriod
		SET PayrollOTRStatusId = (select PayrollOTRStatusId from [payroll].[PayrollOTRStatus] where Name = 'STAGING')
		WHERE Code = @CurrentPayPeriodCode;

	--PayrollOTRStaging
		DELETE FROM [payroll].[PayrollOTRStaging] WHERE
		PayrollOTRPayPeriodId = @PayrollOTRPayPeriodId
		AND
		isSourceLoad = 1;

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
	EXEC [payroll].[sp_Payroll_OTR_GetPayRecordsFrom__Load] @PayPeriodBeginDate, @PayPeriodEndDate

--PayrollOTRStaging inserts
	INSERT INTO payroll.PayrollOTRStaging (PayrollOTRPayPeriodId, isSourceLoad, isSourceDriverPay, Name, LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest, DriverPersonId, PayCode, PayId, Quantity, PayRateAmount, TotalPay, PayPeriodEnding,PayrollNotes,LastUpdate,LastUpdateBy,PUnitId)
		SELECT
			@PayrollOTRPayPeriodId
			,isSourceLoad = 1
			,isSourceDriverPay = 0
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