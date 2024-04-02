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
	@LastUpdateBy INT
)

AS

/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodFinalize] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	--table(s)
	INSERT INTO [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY] ([Name] ,[LoadId] ,[TripNumber] ,[TruckNumber] ,[Client_Id] ,[PickupBy] ,[DeliverBy] ,[DriverType] ,[LegInd] ,[PickOrigin] ,[DropDest] ,[DriverPersonId] ,[PayCode] ,[PayId] ,[Quantity] ,[PayRateAmount] ,[TotalPay] ,[PayPeriodEnding] ,[PayrollNotes] ,[LastUpdate] ,[LastUpdateBy] ,[PUnitId])
		SELECT [Name] ,[LoadId] ,[TripNumber] ,[TruckNumber] ,[Client_Id] ,[PickupBy] ,[DeliverBy] ,[DriverType] ,[LegInd] ,[PickOrigin] ,[DropDest] ,[DriverPersonId] ,[PayCode] ,[PayId] ,[Quantity] ,[PayRateAmount] ,[TotalPay] ,[PayPeriodEnding] ,[PayrollNotes] ,[LastUpdate] ,[LastUpdateBy] ,[PUnitId]
		FROM [payroll].[PayrollOTRStaging];
		
	--pay periods
	DECLARE @ChangeToStatus VARCHAR(30)
	SET @ChangeToStatus = 'FINALIZED'
	DECLARE @StatusNotOpened VARCHAR(30)
	SET @StatusNotOpened = 'NOTOPENED'

		--finalize current
			DECLARE @ActivePayPeriodId INT
			
			EXEC [payroll].[sp_Payroll_OTR_PayPeriodTotals] @LastUpdateBy

			EXEC @ActivePayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy
			
			--IsOpen/PayrollOTRStatus
			UPDATE [payroll].[PayrollOTRPayPeriod]
			SET IsActive = 0, IsOpen = 0, PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = @ChangeToStatus)
			WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId

		--activate next
			DECLARE @NextPayPeriodId INT
			SET @NextPayPeriodId =
			(
				SELECT
				TOP 1 PayrollOTRPayPeriodId 
				FROM [payroll].[PayrollOTRPayPeriod]
				WHERE
				PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = @StatusNotOpened)
				ORDER BY 
				FY, Number
			)
		
			--IsActive
			UPDATE [payroll].[PayrollOTRPayPeriod]
			SET IsActive = 1
			WHERE PayrollOTRPayPeriodId = @NextPayPeriodId
			
GO
