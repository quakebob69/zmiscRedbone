select top 100
	l.loadid,
	l.Driver1_PersonId as Driver_Load,
	ls.Driver1_PersonId as Driver_Stop,
	ca.State, 
	ls.StopNumber,  
	ls.LoadStopTypeId, 
	ls.StartDateTime, 
	ls.DropStartDateTime
from dispatch.Load l
join dispatch.LoadStop ls on l.LoadId = ls.LoadId
join main.ClientAddress ca on ca.clientid = ls.clientid
where
l.loadid in (select Loadid from payroll.PayrollOTRStaging)

order by
l.loadid,
ls.StopNumber
