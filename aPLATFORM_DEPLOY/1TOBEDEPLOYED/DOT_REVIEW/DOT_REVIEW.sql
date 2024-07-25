
select
	p.FirstName as 'Driver First Name'
	,p.LastName as 'Driver Last Name'
	
	,'asdf' as 'Date of Birth (MM/DD/YYY)'
	
	,'asdf' as 'License State'
	
	,'asdf' as 'CDL (Y/N)'
	
	,'asdf' as 'Phone Number'
	
	,'asdf' as 'Date of Hire (MM/DD/YYY)'
		
	,'asdf' as 'Date of Termination (MM/DD/YYY)'
	
	,'-------------------------' as '-------------------------'
	
	,pt.PersonType-- as 'Person Type'

	--,'asdf' as 'asdf'
	
	,*

	
	,Convert(DATE, sh.StatusChangeDate, 108) as Status_Change_Date
from
	main.CertificationPersonMapping cpm
	join main.PersonHiringStatusHistory sh on cpm.PersonId = sh.Personid
	join main.Person p on p.PersonId = sh.PersonId
	join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
	join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
where
	ptm.PersonTypeId = 4-- = 
	and
	StatusChangeDate >= DATEADD(day, -366, GETDATE())
order by
	p.PersonId, StatusChangeDate