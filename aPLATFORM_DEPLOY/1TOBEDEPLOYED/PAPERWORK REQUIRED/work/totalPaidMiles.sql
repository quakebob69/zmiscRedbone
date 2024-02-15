USE RedBone
GO



--SELECT p.personid, p.FirstName, p.LastName, pt.PersonType, pm.PersonTypeId
SELECT
	p.personid
FROM
	main.Person p

	join main.PersonTypeMapping pm on p.PersonId = pm.PersonId
	join main.PersonTypes pt on pm.PersonTypeId = pt.PersonTypeId

/*
WHERE
	(
		(FirstName = 'Allen' and LastName = 'Jones')
		OR
		(FirstName = 'Jack' and LastName = 'Cole')
		OR
		(FirstName = 'John' and LastName = 'Spencer')
		OR
		(FirstName = 'Valmore' and LastName = 'Soto')
		OR
		(FirstName = 'Willem' and LastName = 'Vanyzeren')
		OR
		(FirstName = 'William' and LastName = 'Tribe')


		OR
		(FirstName = 'Al' and LastName = 'Jones')
		OR
		(FirstName = 'James' and LastName = 'Young')
		OR
		(FirstName = 'Jason' and LastName = 'Shaw')
		OR
		(FirstName = 'Jerry' and LastName = 'Adams')
		OR
		(FirstName = 'Jerry' and LastName = 'Norton')
		OR
		(FirstName = 'John' and LastName = 'Norris')
		OR
		(FirstName = 'Kirt' and LastName = 'Williams')
		OR
		(FirstName = 'Leslie' and LastName = 'Eklund')
		OR
		(FirstName = 'Patrick' and LastName = 'Kelleher')
		OR
		(FirstName = 'Richard' and LastName = 'Houston')
	)
*/
	--AND (pt.PersonTypeId <> 1)
	--AND (pt.PersonTypeId <> 2)
	--AND (pt.PersonTypeId <> 19)


--group by p.personid, p.FirstName, p.LastName, pm.PersonTypeId, pt.PersonType
GROUP BY p.personid
HAVING COUNT(p.personid) = 1
--order by p.personid, PersonTypeId




;






;








