
select
	p.FirstName as 'Driver First Name', p.LastName as 'Driver Last Name', 'Date of Birth (MM/DD/YYY)' as 'Date of Birth (MM/DD/YYY)', 'License State' as 'License State', 'CDL (Y/N)' as 'CDL (Y/N)', 'asdf' as 'asdf', 'Phone Number' as 'Phone Number', 'Date of Hire (MM/DD/YYY)' as 'Date of Hire (MM/DD/YYY)',    '----------------------------------------', *,  Convert(DATE, sh.StatusChangeDate, 108) as Status_Change_Date
from
	main.PersonHiringStatusHistory sh
	join main.Person p on p.PersonId = sh.PersonId
where
	StatusChangeDate >= DATEADD(day, -366, GETDATE())
order by
	p.PersonId, StatusChangeDate