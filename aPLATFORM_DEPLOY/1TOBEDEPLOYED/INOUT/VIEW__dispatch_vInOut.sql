DROP VIEW IF EXISTS [dispatch].[vInOut]
GO


CREATE VIEW [dispatch].[vInOut] AS
	/*
		select top 100 loadid from dispatch.load order by loadid desc
	*/



	select top 1000
		l.dispatchFleetManagerid
		--,fm.name
		--,p.FirstName + ' ' + p.LastName as FullName
		,l.loadid
		,ls.LoadStopTypeId
		,ls.ArrivalDateTime
		,ls.DepartureDateTime
	from
		dispatch.load l
		join dispatch.loadStop ls on l.loadid = ls.loadid
		--join dispatch.DispatchFleetManager fm on l.dispatchFleetManagerid = fm.DispatchFleetManagerId
		--join main.Person p on p.PersonId = fm.PersonId
	where



		l.loadid > 63741
		and




		(ls.LoadStopTypeId = 1 or ls.LoadStopTypeId = 3)
		and
		(ls.ArrivalDateTime is null OR ls.DepartureDateTime is null)
	order by loadid desc


GO



select * from  [dispatch].[vInOut]







