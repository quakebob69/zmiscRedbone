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



select * from equipment.PUnit where  DispatchFleetManagerId is not null order by DispatchFleetManagerId;
select * from equipment.PUnit where Unit_ID in ('207', '272');

