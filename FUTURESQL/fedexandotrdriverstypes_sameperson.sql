select * from main.person where personid in 

(
select p.personid
--, count(p.personid) as fullname
from main.Person p
join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
join main.PersonTypes pt on ptm.PersonTypeId= pt.PersonTypeId
where p.IsActive = 1
and
(pt.PersonTypeId = 3 or pt.PersonTypeId = 4)
group by p.personid
having
count(p.personid) > 1
--order by fullname
)