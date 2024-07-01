select pm.*--, '------------------', p.*
from 
main.CertificationPersonMapping pm
join main.Person p on pm.PersonId = p.PersonId
where 
p.FirstName = 'DANIEL'
and
p.LastName = 'CALL'


/*
	UPDATE main.CertificationPersonMapping
	set ActiveInd = 0
	where 
	CertificationPersonMappingId = 6109
*/