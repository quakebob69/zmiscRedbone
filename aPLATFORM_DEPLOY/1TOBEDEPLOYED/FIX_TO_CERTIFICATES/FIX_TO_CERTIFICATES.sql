select pm.*--, '------------------', p.*
from 
main.CertificationPersonMapping pm
join main.Person p on pm.PersonId = p.PersonId
where 
p.FirstName = 'CHRISTINE'
and
p.LastName = 'ROBINSON'


/*
	UPDATE main.CertificationPersonMapping
	set ActiveInd = 0
	where 
	CertificationPersonMappingId = 6109
*/