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



--  fleet managers peeps
	select e.Unit_ID, p.FirstName + ' ' + p.LastName as FullName from
		main.Driver d
		join main.Person p on d.PersonId = p.personid	
		join equipment.PUnit e on d.PunitId = e.punitid
	where e.punitid in 
		(
			select punitid from equipment.PUnit pu
			where pu.DispatchFleetManagerId is not null
		)
	order by e.Unit_ID desc




--select punitid, Unit_ID from equipment.PUnit where Unit_ID in ('207', '272');






--drivers, with trucks
	select
		e.Unit_ID, '' as asdfasdasdfasdasdfasdasdfasdasdfasdasdfasd
	from
		main.Driver d
		join main.Person p on d.PersonId = p.personid	
		join equipment.PUnit e on d.PunitId = e.punitid
	--Where e.Unit_ID = '44'
	ORDER BY 
	  LEFT(e.Unit_ID, PATINDEX('%[0-9]%', e.Unit_ID + 'a') - 1),
	  CAST(SUBSTRING(e.Unit_ID, PATINDEX('%[0-9]%', e.Unit_ID + 'a'), LEN(e.Unit_ID)) AS INT) desc;





--Trucks,  with no drivers
	select
		e.Unit_ID, '' as asdfasdasdfasdasdfasdasdfasdasdfasdasdfasd,  e.*
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
	ORDER BY 
	  LEFT(e.Unit_ID, PATINDEX('%[0-9]%', e.Unit_ID + 'a') - 1),
	  CAST(SUBSTRING(e.Unit_ID, PATINDEX('%[0-9]%', e.Unit_ID + 'a'), LEN(e.Unit_ID)) AS INT) desc;












/*
	SELECT TOP (1000) [GroupTypeId]
      ,[Group]
      ,[Enabled]
	FROM [RedBone].[main].[GroupType]
*/


