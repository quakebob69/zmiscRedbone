select 'DropStartDateTime missing on legs+++', s.loadid, s.LoadStopTypeId, s.StartDateTime, s.dropStartDateTime
from
	dispatch.loadstop s
	join dispatch.load l on l.loadid = s.loadid
where
	l.LoadStatusTypeId <> 100 and
	l.LoadStatusTypeId > 5
	and 
	(
		(
			s.LoadStopTypeId = 2
			and 
			s.DropStartDateTime is null	
		)
		or
		(
			s.LoadStopTypeId <> 4
			and 
			s.StartDateTime is null	
		)
		
	)
order by
	l.loadid desc


select 'DropStartDateTime missing on legs+++', s.loadid, s.LoadStopTypeId, s.StartDateTime, s.dropStartDateTime
from
	dispatch.loadstop s
	join dispatch.load l on l.loadid = s.loadid
where
	l.LoadStatusTypeId <> 100 and
	l.LoadStatusTypeId > 5
	and 
	(
		(
			s.LoadStopTypeId = 2
			and 
			s.DropStartDateTime is null	
		)
		or
		(
			s.LoadStopTypeId <> 4
			and 
			s.StartDateTime is null	
		)
		
	)
order by
	s.StartDateTime desc



select 'DropStartDateTime missing on legs+++', s.loadid, s.LoadStopTypeId, s.StartDateTime, s.dropStartDateTime
from
	dispatch.loadstop s
	join dispatch.load l on l.loadid = s.loadid
where
	l.LoadStatusTypeId <> 100 and
	l.LoadStatusTypeId > 5
	and 
	(
		(
			s.LoadStopTypeId = 2
			and 
			s.DropStartDateTime is null	
		)
		or
		(
			s.LoadStopTypeId <> 4
			and 
			s.StartDateTime is null	
		)
		
	)
order by
	s.dropStartDateTime desc


