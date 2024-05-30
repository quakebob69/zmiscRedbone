SELECT TOP (1000) [PayrollOTRStagingId]
      ,[PayrollOTRPayPeriodId]
      ,[PayrollOTRDataSourceId]
      ,[IsHeld]
      ,[Name]
      ,[LoadId]
      ,[DriverPayId]
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
      ,[LastUpdate]
      ,[LastUpdateBy]
      ,[PUnitId]
  FROM [RedBoneThomas].[payroll].[PayrollOTRStaging]
  where
  PayrollOTRDataSourceId = 1 
  and name = 'JUSTIN GRIFFITH'
  and payid = 84
  order by
  name,
  PickupBy,
  DeliverBy



  SELECT StartDateTime, DropStartDateTime, '----------', * FROM dispatch.LOADSTOP
  wHERE
  LOADID in
	  (SELECT 
		  [LoadId]
	  FROM [RedBoneThomas].[payroll].[PayrollOTRStaging]
	  where
	  PayrollOTRDataSourceId = 1 
	  and name = 'JUSTIN GRIFFITH'
	  and payid = 84)

and
--LoadStopTypeId in (2,3)
LoadStopTypeId in (3)



  SELECT StartDateTime, DropStartDateTime, '----------', * FROM dispatch.LOADSTOP
  wHERE
  LOADID in
	  (SELECT 
		  [LoadId]
	  FROM [RedBoneThomas].[payroll].[PayrollOTRStaging]
	  where
	  PayrollOTRDataSourceId = 1 
	  and name = 'JUSTIN GRIFFITH'
	  and payid = 84)

--and
--LoadStopTypeId in (2,3)

order by 
loadid, StopNumber


--select * from main.Person WHERE PERSONid = 2081