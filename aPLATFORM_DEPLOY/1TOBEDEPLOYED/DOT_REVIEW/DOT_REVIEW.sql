
select	*



-- Convert(DATE, sh.StatusChangeDate, 108) as HireDate  

from	 main.PersonHiringStatusHistory SH

where StatusChangeDate

order by
PersonId, StatusChangeDate