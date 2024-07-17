	select
		e.Unit_ID, e.PunitId, dfm.DispatchFleetManagerId,  dfm.name as 'DriverManagerName', p.PersonId, p.FirstName + ' ' + p.LastName as DriverFullName, p.FirstName as DriverFirstName, p.LastName as DriverLastName
	from
		main.Driver d
		full join main.Person p on d.PersonId = p.personid	
		full join equipment.PUnit e on d.PunitId = e.punitid
		full join dispatch.DispatchFleetManager dfm on dfm.DispatchFleetManagerid = e.DispatchFleetManagerid
		full join equipment.PunitMapping pum on e.PUnitId = pum.PunitId
		full join main.GroupType gt on gt.GroupTypeId = pum.GroupTypeId
	where 
		ActiveInd = 1
		and
		pum.PUnitActiveTypeId = 1
		/*
			and
			gt.GroupTypeId =
				(
					select GroupTypeId from main.GroupType WHERE [group] = 'OTR'
				)
		*/
	ORDER BY TRY_CAST(e.Unit_ID AS INT)


	--select * from equipment.PUnit where Unit_ID = '185'
	--select * from main.Driver where punitid = 1115
	--select * from equipment.PunitMapping where punitid = 1115



/*
--truck/fleetManagers (truck)
--[ALL TRUCKS WITH DispatchFleetManager]
	select e.Unit_ID, dfm.name
	from
		equipment.PUnit e 
		join dispatch.DispatchFleetManager dfm on dfm.DispatchFleetManagerid = e.DispatchFleetManagerid
	where e.punitid in 
		(
			select punitid from equipment.PUnit pu
			where pu.DispatchFleetManagerId is not null
		)
	ORDER BY TRY_CAST(e.Unit_ID AS INT) desc




--truck/fleetManagers/driver
--[ALL DRIVERS WITH TRUCKS AND DispatchFleetManager]
	select e.Unit_ID, dfm.name, p.FirstName + ' ' + p.LastName as FullName
	from
		main.Driver d
		join main.Person p on d.PersonId = p.personid	
		join equipment.PUnit e on d.PunitId = e.punitid
		join dispatch.DispatchFleetManager dfm on dfm.DispatchFleetManagerid = e.DispatchFleetManagerid
	where e.punitid in 
		(
			select punitid from equipment.PUnit pu
			where pu.DispatchFleetManagerId is not null
		)
	ORDER BY TRY_CAST(e.Unit_ID AS INT) desc





--Trucks/[no drivers]/DispatchFleetManagerId 
--[ALL TRUCKS WITHOUT DRIVERS, BUT HAVE DispatchFleetManager]
	select
		e.Unit_ID, dfm.name
	from
		equipment.PUnit e
		join dispatch.DispatchFleetManager dfm on dfm.DispatchFleetManagerid = e.DispatchFleetManagerid
		join equipment.PunitMapping m on e.PUnitId = m.PunitId
		join main.GroupType gt on gt.GroupTypeId = m.GroupTypeId
	where e.PunitId
		not in
		(
			select 
				PunitId
			from
				main.Driver d
			where
				punitid is not null
		)
	and
		ActiveInd = 1
	and
		gt.GroupTypeId = 4
	and
		e.DispatchFleetManagerId is not null
	ORDER BY TRY_CAST(e.Unit_ID AS INT) desc







--trucks/drivers [ALL TRUCKS WITH DRIVERS]
	select
		e.Unit_ID, p.FirstName + ' ' + p.LastName as FullName
	from
		main.Driver d
		join main.Person p on d.PersonId = p.personid	
		join equipment.PUnit e on d.PunitId = e.punitid
	ORDER BY TRY_CAST(e.Unit_ID AS INT) desc





--Trucks/[no drivers] [ALL TRUCKS WITHOUT DRIVERS]
	select
		e.Unit_ID, e.DispatchFleetManagerId
	from
		equipment.PUnit e
		join equipment.PunitMapping m on e.PUnitId = m.PunitId
		join main.GroupType gt on gt.GroupTypeId = m.GroupTypeId
	where e.PunitId
		not in
		(
			select 
				PunitId
			from
				main.Driver d
			where
				punitid is not null
		)
	and
		ActiveInd = 1
	and
		gt.GroupTypeId = 4
	ORDER BY TRY_CAST(e.Unit_ID AS INT) desc
*/







/*
	select * from main.PersonTypes


	select
		*
	from
		main.PersonTypeMapping pm
		join main.Person p on p.PersonId = pm.PersonId
	where
	PersonTypeid = 19
*/


/*
	--62602

	1642	260
	1591	261
	1648	262
	1649	263
	1650	264
	1651	265
	1652	266
	1653	267
	1654	268
	1655	269



	207 = spare
	272 = spare
*/


/*
	SELECT TOP (1000) [GroupTypeId]
      ,[Group]
      ,[Enabled]
	FROM [RedBone].[main].[GroupType]
*/

