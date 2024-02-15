exec [payroll].[sp_StagePayrollOTR] '2350', 2775;

SELECT TOP (1000) [PayrollStagingOTRId]
      ,[PayPeriodOTRId]
      ,[Name]
      ,[LoadId]
      ,[TripNumber]
      ,[TruckNumber]
      ,[Client_Id]
      ,[PickupBy]
      ,[DeliverBy]
      ,[DriverType]
      ,[LegInd]
      ,[PickOrigin]
      ,[DropDest]
      ,[DriverPersonId]
      ,[PayCode]
      ,[PayId]
      ,[Quantity]
      ,[PayRateAmount]
      ,[TotalPay]
      ,[PayPeriodEnding]
      ,[PayrollNotes]
      ,[PUnitId]
  FROM [RedBone].[payroll].[PayrollStagingOTR];

--select * from payroll.PayPeriodOTR;
