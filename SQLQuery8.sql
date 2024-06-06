select top 100
	l.loadid,
	ls.StopNumber,  
	ls.LoadStopTypeId, 
	l.Driver1_PersonId as DriverFromLoadRec,
	ca.State as PickOrDropState, 
	ls.Driver1_PersonId as DriverFromStopRec,
	ls.StartDateTime as PickOrDropDt, 
	ls.DropStartDateTime as PickOrDropDtLeg
from
	dispatch.Load l
	join dispatch.LoadStop ls on l.LoadId = ls.LoadId
	join main.ClientAddress ca on ca.clientid = ls.clientid
--where
	--l.loadid in (select Loadid from payroll.PayrollOTRStaging)
	--l.LoadId in (57013)
order by
	l.loadid,
	ls.StopNumber


SELECT  top 100 dispatch.[Load].LoadId, dispatch.LoadStop.StopNumber, dispatch.LoadStop.LoadStopTypeId, dispatch.[Load].Driver1_PersonId AS DriverFromLoadRec, main.ClientAddress.State AS PickOrDropState, 
                  dispatch.LoadStop.Driver1_PersonId AS DriverFromStopRec, dispatch.LoadStop.StartDateTime AS PickOrDropDt, dispatch.LoadStop.DropStartDateTime as PickOrDropDtLeg
FROM     dispatch.[Load] INNER JOIN
                  dispatch.LoadStop ON dispatch.[Load].LoadId = dispatch.LoadStop.LoadId INNER JOIN
                  main.ClientAddress ON dispatch.LoadStop.ClientId = main.ClientAddress.ClientId
order by
	dispatch.Load.LoadId,
	dispatch.LoadStop.StopNumber