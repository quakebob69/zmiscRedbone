DECLARE @FINAL_LIST TABLE
	(
		FirstName VARCHAR(100)
		,LastName VARCHAR(100)
		,Birthday VARCHAR(100)
		,LicenseNumb VARCHAR(100)
		,LicenseState VARCHAR(100)
		,CDL_Y_N VARCHAR(100)
		,PhoneNumber VARCHAR(100)
		,DateHire VARCHAR(100)
		,DateTermination VARCHAR(100)
	)



select
	p.FirstName as 'Driver First Name'
	,p.LastName as 'Driver Last Name'
	
	,Convert(VARCHAR, p.Birthday, 101) as 'Date of Birth (MM/DD/YYYY)'

		,'asdf' as 'License State'
		,'asdf' as 'License #'
		,'asdf' as 'CDL (Y/N)'
	
		,'asdf' as 'Phone Number'
	
		,'asdf' as 'Date of Hire (MM/DD/YYYY)'
		
		,'asdf' as 'Date of Termination (MM/DD/YYYY)'
	
	,'-------------------------' as '-------------------------'
	
	,pt.PersonType-- as 'Person Type'
	,phst.Description as 'HiringS tatus Type'
	,Convert(VARCHAR, sh.StatusChangeDate, 101) as 'Status Change Date'

	,'-------------------------' as '-------------------------'

	--,'asdf' as 'asdf'
	
	,*

	
from
	main.CertificationPersonMapping cpm
	join main.PersonHiringStatusHistory sh on cpm.PersonId = sh.Personid
	join main.PersonHiringStatusType phst on phst.PersonHiringStatusTypeId = sh.PersonHiringStatusTypeId
	join main.Person p on p.PersonId = sh.PersonId
	join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
	join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
where
	ptm.PersonTypeId = 4
		
		--and cpm
		--PHONE NUMBE

	and
	StatusChangeDate >= DATEADD(day, -366, GETDATE())
order by
	p.PersonId, StatusChangeDate