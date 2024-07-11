	select
		l.dispatchFleetManagerid
		,fm.name
		,p.FirstName + ' ' + p.LastName as FullName
		,l.loadid
		,ls.LoadStopTypeId
	from
		dispatch.load l
		join dispatch.loadStop ls on l.loadid = ls.loadid
		join dispatch.DispatchFleetManager fm on l.dispatchFleetManagerid = fm.DispatchFleetManagerId
		join main.Person p on p.PersonId = fm.PersonId
	where
		(l.dispatchFleetManagerid is not null)
		and
		(ls.LoadStopTypeId = 1 or ls.LoadStopTypeId = 3)
		and
		(ls.LoadStopTypeId = 1)
