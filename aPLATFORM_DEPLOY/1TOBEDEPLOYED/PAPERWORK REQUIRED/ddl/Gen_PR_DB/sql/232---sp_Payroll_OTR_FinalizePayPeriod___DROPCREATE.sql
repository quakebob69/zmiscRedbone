/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_FinalizePayPeriod]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_FinalizePayPeriod]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_FinalizePayPeriod]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [payroll].[sp_Payroll_OTR_FinalizePayPeriod]
(
	@CurrentPayPeriodCode VARCHAR(4)
 ,@LastUpdateBy Int
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_FinalizePayPeriod] '2350', 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	
	INSERT INTO [dispatch].[PR_OTR_History] ([Name] ,[LoadId] ,[TripNumber] ,[TruckNumber] ,[Client_Id] ,[PickupBy] ,[DeliverBy] ,[DriverType] ,[LegInd] ,[PickOrigin] ,[DropDest] ,[DriverPersonId] ,[PayCode] ,[PayId] ,[Quantity] ,[PayRateAmount] ,[TotalPay] ,[PayPeriodEnding] ,[PayrollNotes] ,[LastUpdate] ,[LastUpdateBy] ,[PUnitId])
		SELECT [Name] ,[LoadId] ,[TripNumber] ,[TruckNumber] ,[Client_Id] ,[PickupBy] ,[DeliverBy] ,[DriverType] ,[LegInd] ,[PickOrigin] ,[DropDest] ,[DriverPersonId] ,[PayCode] ,[PayId] ,[Quantity] ,[PayRateAmount] ,[TotalPay] ,[PayPeriodEnding] ,[PayrollNotes] ,[LastUpdate] ,[LastUpdateBy] ,[PUnitId]
		FROM [payroll].[PayrollOTRStaging];


GO
