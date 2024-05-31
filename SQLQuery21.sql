/*
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



									  SELECT Driver1_PersonId, Driver2_PersonId, StartDateTime, DropStartDateTime, '----------', * FROM dispatch.LOADSTOP
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


									  SELECT Driver1_PersonId, Driver2_PersonId, '----------' as '----------------------------------------------------------------------------------------------------------------', * FROM dispatch.LOAD
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
									loadid


--select * from main.Person WHERE PERSONid = 2081




select top 100 l.DeadHead, l.PaidEmpty, * 
from dispatch.Load l
join dispatch.LoadStop ls on l.LoadId = ls.LoadId
--where l.loadid = 57692
where l.PaperworkRecvdDate is not null
and CreatedDt > '2023-12-15 20:18:31.840'
and DeadHead > 500
order by  l.LoadId desc, l.DeadHead desc




--57309

select PickOrigin, DropDest, loadid, TripNumber, * from dispatch.PR_OTR_History 
--where name like '%GREGORY WALLACE%'
where
loadid > 50000
and payid = 84
order by
name, dispatch.PR_OTR_History.loadid 














select PickOrigin, DropDest, PR_OTR_History.PickupBy, DeliverBy,loadid, TripNumber, * from dispatch.PR_OTR_History 
where 
name like '%BRETT%CIMRHAKL%' and
PickupBy > '2023-09-01 09:00:00.000'
and
PickupBy < '2023-10-29 09:00:00.000'
and payid = 84
order by
name, PR_OTR_History.PickupBy







select PickOrigin, DropDest, PR_OTR_History.PickupBy, DeliverBy,loadid, TripNumber, * from dispatch.PR_OTR_History 
where 
--name like '%BRETT CIMRHAKL%' and
PickupBy > '2023-09-15 09:00:00.000'
--and
--PickupBy < '2023-05-29 09:00:00.000'
and payid = 84
and (Client_Id <> 'AUT1003' or Client_Id <> 'PIC1004')
order by
name, PR_OTR_History.PickupBy





select top 100 ls.CLIENTid, ls.StartDateTime, ls.DropStartDateTime, ls.* 
from dispatch.Load l
join dispatch.LoadStop ls on l.LoadId = ls.LoadId
--where l.loadid = 57692
where l.PaperworkRecvdDate is not null
and LoadStopTypeId = 2
and ls.clientid in (select CLIENTid from main.Client where ClientName like '%redbone%' or ClientName like '%REDBONE%')
order by l.loadid desc;




select top 100 ca.State, ls.CLIENTid, ls.StartDateTime, ls.DropStartDateTime, ls.* 
from dispatch.Load l
join dispatch.LoadStop ls on l.LoadId = ls.LoadId
join main.ClientAddress ca on ca.clientid = ls.clientid
--where l.loadid = 57692
where l.PaperworkRecvdDate is not null
and ls.clientid not in (select CLIENTid from main.Client where ClientName like '%redbone%' or ClientName like '%REDBONE%')
and LoadStopTypeId = 2
order by l.loadid desc;





--select * from main.Client where ClientId = '5098'



select PickOrigin, DropDest, PR_OTR_History.PickupBy, DeliverBy,loadid, TripNumber, * from dispatch.PR_OTR_History 
where 
name like '%GARY PEEBLES%' 
and payid = 84
order by
name, PR_OTR_History.PickupBy

--select top 10 * from main.ClientAddress




*/
select L.ClientId as 'LOAD: Client', l.Driver1_PersonId as 'LOAD: Driver', ls.StopNumber as 'stop: Stop Number', ls.ClientId as 'stop: Client', ls.StartDateTime as 'stop: Non-Leg Date', ls.DropStartDateTime as 'stop: Leg Date', ls.Driver1_PersonId as 'stop: Leg Driver', '---------------------------------------------', ls.*, ls.*
from dispatch.Load l
join dispatch.LoadStop ls on l.LoadId = ls.LoadId
where l.loadid = 57013
--and LoadStopTypeId = 2
order by ls.StopNumber  desc;


--getLast

