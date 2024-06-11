--select count(*) from payroll.PayrollOTRStaging;

--delete from payroll.PayrollOTRdriverloadchain




-- bad dates
select
	count(*) as BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD
from
	payroll.PayrollOTRdriverloadchain
where
	enddate <= begindate





--all
select
	count(distinct(PayrollOTRdriverloadchainid)) AS 'NUM CHAINS (including loads with legs)'
from
	payroll.PayrollOTRdriverloadchain




--deets
select
	'CHAIN DETAILS (with legs)' AS 'CHAIN DETAILS (with legs)', *
from
	payroll.PayrollOTRdriverloadchain
ORDER by
	personid, enddate




select 
	count(distinct(PayrollOTRdriverloadchainid)) AS 'NUM CHAINS (ONLY loads with legs)'from
	payroll.PayrollOTRdriverloadchain c
	join dispatch.loadstop s on c.loadid = s.loadid
where
	s.LoadStopTypeId = 2
	


select 
	count(distinct(PayrollOTRdriverloadchainid + s.loadstopid)) - count(distinct(PayrollOTRdriverloadchainid)) AS 'asdfs' 
from
	payroll.PayrollOTRdriverloadchain c
	join dispatch.loadstop s on c.loadid = s.loadid
where
	s.LoadStopTypeId = 2
	




	
SELECT count(*) as '1 leg'  
	FROM (
			select distinct loadid from dispatch.loadstop
				where loadid in 
						(
							select
								loadid
							from
								payroll.PayrollOTRdriverloadchain
						)

				and
					dispatch.loadstop.LoadStopTypeId <> 2
				group by
					loadid
	having
		count(loadid) = 2
) subquery;



	
SELECT COUNT(*) as '2 legs'  
	FROM (
			select loadid from dispatch.loadstop
				where loadid in 
						(
							select
								loadid
							from
								payroll.PayrollOTRdriverloadchain
						)

				and
					dispatch.loadstop.LoadStopTypeId = 2
				group by
					loadid
	having
		count(loadid) = 2
) subquery;






--asdf
/*
--no legs
	56703
	56774
	57035
	56680
	57012
	56920
	56820
	56989
	56843
	56780
	56674
	57135
	56482
	56494
	56983
	56628
	56837
	56972
	57169
	56534
	56883
	56926
	56488
	56634
*/


select '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------', '-----------------'

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1 leg
				select
					p.firstname, p.lastname, c.*
				from
					payroll.PayrollOTRdriverloadchain c
					join main.Person p on c.personid = p.PersonId
				where
					loadid = 56460






/*
	----------------56357
	56460
	56477
	56480
	56523
	56525
	56540
	56584
	56609
	56643
	56697
	56702
	56716
	56765
	56820
	56850
	56862
	56886
	56888
	56903
	56910
	56913
	56951
	56973
	56983
	56987
	57001
	57013
	57024
	57037
	57052
	57114
	57115
	57116
	57161
	57167
	57228
	57268
	57292
*/



--2 legs:

/*
	56547
	56572
	56616
	56634
	56681
	56809
	57171
	57210
	57234
*/






