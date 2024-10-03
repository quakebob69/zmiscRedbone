select
--pt.*, p.*, '--------', pem.*
from main.PersonEntitlementMapping pem
join main.Person p on p.PersonId = pem.PersonId
join main.PersonTypeMapping ptm on ptm.PersonId = p.PersonId
join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
where
pt.PersonTypeId
in 
(select PersonTypeId from main.PersonTypes where PersonType like '%dmin')



and 

PersonTypeId



--where EntitlementId = (select EntitlementId from main.Entitlement where EntitlementName = 'Platform Access')


select count(*) from main.person;


