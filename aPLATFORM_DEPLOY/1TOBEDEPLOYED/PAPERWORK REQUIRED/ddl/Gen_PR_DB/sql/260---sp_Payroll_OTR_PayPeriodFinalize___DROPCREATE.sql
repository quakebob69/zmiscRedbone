/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodFinalize]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodFinalize]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodFinalize]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodFinalize]
(
	@LastUpdateBy Int
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodFinalize] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	INSERT INTO [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY] ([Name] ,[LoadId] ,[TripNumber] ,[TruckNumber] ,[Client_Id] ,[PickupBy] ,[DeliverBy] ,[DriverType] ,[LegInd] ,[PickOrigin] ,[DropDest] ,[DriverPersonId] ,[PayCode] ,[PayId] ,[Quantity] ,[PayRateAmount] ,[TotalPay] ,[PayPeriodEnding] ,[PayrollNotes] ,[LastUpdate] ,[LastUpdateBy] ,[PUnitId])
		SELECT [Name] ,[LoadId] ,[TripNumber] ,[TruckNumber] ,[Client_Id] ,[PickupBy] ,[DeliverBy] ,[DriverType] ,[LegInd] ,[PickOrigin] ,[DropDest] ,[DriverPersonId] ,[PayCode] ,[PayId] ,[Quantity] ,[PayRateAmount] ,[TotalPay] ,[PayPeriodEnding] ,[PayrollNotes] ,[LastUpdate] ,[LastUpdateBy] ,[PUnitId]
		FROM [payroll].[PayrollOTRStaging];

GO