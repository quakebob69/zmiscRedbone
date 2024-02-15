USE Redbone
GO

/*
select * from main.PersonPhoneNumber
where personid in 
	(select personid from main.person where personid in
		(select PersonId
		from main.PersonPhoneNumber
		WHERE UseForDispatch IS NULL)
	and
	isactive = 1)
and
UseForDispatch IS NULL;
*/

update main.PersonPhoneNumber
set UseForDispatch = 0
where personid in 
	(select personid from main.person where personid in
		(select PersonId
		from main.PersonPhoneNumber
		WHERE UseForDispatch IS NULL)
	and
	isactive = 1)
and
UseForDispatch IS NULL;
