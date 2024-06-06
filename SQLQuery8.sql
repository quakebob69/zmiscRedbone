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
where
	--l.loadid in (select Loadid from payroll.PayrollOTRStaging)
	l.LoadId in (57013)
order by
	l.loadid,
	ls.StopNumber
