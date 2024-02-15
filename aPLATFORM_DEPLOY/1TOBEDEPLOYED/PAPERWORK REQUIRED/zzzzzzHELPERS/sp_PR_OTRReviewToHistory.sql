USE [RedBone]
GO

/****** Object:  StoredProcedure [dbo].[sp_PR_OTRReviewToHistory]    Script Date: 2/1/2024 7:14:50 AM ******/
DROP PROCEDURE [dbo].[sp_PR_OTRReviewToHistory]
GO

/****** Object:  StoredProcedure [dbo].[sp_PR_OTRReviewToHistory]    Script Date: 2/1/2024 7:14:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_PR_OTRReviewToHistory]
(
	@PayPeriodBeginDate datetime
	,@PayPeriodEndDate datetime
	,@LastUpdateBy Int
)

AS

/*

	exec sp_PR_OTRReviewToHistory '03-24-2022','03-30-2022',1667


*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END


DELETE FROM [dispatch].[PR_OTR_History] where PayPeriodEnding = @PayPeriodEndDate

DROP TABLE IF EXISTS #TEMP_OTR_Pay
DROP TABLE IF EXISTS #TEMP_OTR_OtherPay

CREATE TABLE #TEMP_OTR_Pay(
	[Name] [varchar](max) NULL,
	[LoadId] [int] NULL,
	[TripNumber] varchar(15) NULL,
	[TruckNumber] [int] NULL,
	[Client_Id] [varchar](max) NULL,
	[PickupBy] [datetime] NULL,
	[DeliverBy] [datetime] NULL,
	[DriverType] [varchar](max) NULL,
	[LegInd] [varchar] (max) NULL,
	[PickOrigin] [varchar](max) NULL,
	[DropDest] [varchar](max) NULL,
	[DriverPersonId] [int] NULL,
	[PayCode] [varchar](max) NULL,
	[PayId] [int] NULL,
	[Quantity] [decimal](10, 2) NULL,
	[PayRateAmount] [decimal](10, 2) NULL,
	[PUnitId] [int] NULL
)

INSERT INTO #TEMP_OTR_Pay

EXEC	sp_DriverPayRollByDeliveryDate_Pay @PayPeriodBeginDate, @PayPeriodEndDate


CREATE TABLE #TEMP_OTR_OtherPay
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

INSERT INTO #TEMP_OTR_OtherPay

EXEC [dbo].[sp_DriverPayRollByDeliveryDate_sub_Processing] @PayPeriodBeginDate, @PayPeriodEndDate



INSERT INTO [dispatch].[PR_OTR_History] (Name, LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest, DriverPersonId, PayCode, PayId, Quantity, PayRateAmount, TotalPay, PayPeriodEnding,PayrollNotes,LastUpdate,LastUpdateBy,PUnitId)
SELECT 
	Name = DriverName
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
FROM #TEMP_OTR_OtherPay

WHERE DriverPersonId NOT in (8,73)	--Exlude Al Jones, John Norris

union all

SELECT 
	[Name]
	, [LoadId]
	, [TripNumber]
	, [TruckNumber]
	, [Client_Id]
	, [PickupBy]
	, [DeliverBy]
	, [DriverType]
	, [LegInd]
	, [PickOrigin]
	, [DropDest]
	, [DriverPersonId]
	, [PayCode]
	, [PayId]
	, [Quantity]
	, [PayRateAmount]
	, TotalPay = Quantity * PayRateAmount
	, @PayPeriodEndDate 
	, PayNotes = NULL
	, LastUpdate = GETDATE()
	, @LastUpdateBy
	, PUnitId

FROM #TEMP_OTR_Pay

WHERE DriverPersonId NOT in (8,73)	--Exlude Al Jones, John Norris

exec sp_Payroll_PTO_Accrual_OTR @PayPeriodEndDate, @LastUpdateBy
GO


