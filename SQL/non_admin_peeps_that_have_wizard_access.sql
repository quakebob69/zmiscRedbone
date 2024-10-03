select * from main.PersonEntitlementMapping
	where personid in
		(
			select
				distinct p.personid
				--*
			from
				main.person p
			where
				p.personid not in 
					(
						--admin peeps
						select
						distinct(p.PersonId)
						from main.PersonEntitlementMapping pem
						join main.Person p on p.PersonId = pem.PersonId
						join main.PersonTypeMapping ptm on ptm.PersonId = p.PersonId
						join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
						where
						pt.PersonTypeId
						in 
						(select PersonTypeId from main.PersonTypes where PersonType like '%dmin')
					)
				and
					p.IsActive = 1
		)
	and
		EntitlementId
			= (select EntitlementId from main.Entitlement where EntitlementName = 'Platform Access')
