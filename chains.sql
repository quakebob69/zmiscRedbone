--select count(*) from payroll.PayrollOTRStaging;

--delete from payroll.PayrollOTRdriverloadchain




-- bad dates
select
	count(*) as BAD
from
	payroll.PayrollOTRdriverloadchain
where
	enddate <= begindate



SELECT 'CHAINZ++++++++++++++++++++++++++++++++++++++++++++++++++++' AS 'CHAINZ'
--all
select
	count(distinct(PayrollOTRdriverloadchainid)) AS 'NUM CHAINS --- ALL',  (485 + 1*39 + 2*9) as 'CHECK WORK'
from
	payroll.PayrollOTRdriverloadchain




--deets
select
	'NUM CHAINS - ALL' AS 'NUM CHAINS - ALL', *
from
	payroll.PayrollOTRdriverloadchain
ORDER by
	personid, enddate









SELECT 'LOADZ++++++++++++++++++++++++++++++++++++++++++++++++++++' AS 'LOADZ'



select 
	count(distinct(PayrollOTRdriverloadchainid)) AS 'NUM CHAINS - LOADS WITH LEGS ------ (all) -----', '48' as '----CHECK WORK' from
	payroll.PayrollOTRdriverloadchain c
	join dispatch.loadstop s on c.loadid = s.loadid
where
	s.LoadStopTypeId = 2
	




		
SELECT count(*) as 'NUM CHAINS - LOADS WITH LEGS ------ (1) ------'  , '39' as '----CHECK WORK' 
	FROM (
		select 
			--count(c.loadid) as cnt
			count(distinct c.loadid) as cnt
		from
			payroll.PayrollOTRdriverloadchain c
			join dispatch.loadstop s on c.loadid = s.loadid
		where
			s.LoadStopTypeId = 2
		group by
			c.loadid
		having
			count(c.loadid) = 1
	) subquery;




		
SELECT count(*) as 'NUM CHAINS - LOADS WITH LEGS ------ (2) ------'  , '9' as '----CHECK WORK' 
	FROM (
		select 
			--count(c.loadid) as cnt
			count(distinct c.loadid) as cnt
		from
			payroll.PayrollOTRdriverloadchain c
			join dispatch.loadstop s on c.loadid = s.loadid
		where
			s.LoadStopTypeId = 2
		group by
			c.loadid
		having
			count(c.loadid) = 2
	) subquery;



		
SELECT count(*) as 'NUM CHAINS - LOADS WITH LEGS ------ (> 2) ----' , '0' as '----CHECK WORK' 
	FROM (
		select 
			--count(c.loadid) as cnt
			count(distinct c.loadid) as cnt
		from
			payroll.PayrollOTRdriverloadchain c
			join dispatch.loadstop s on c.loadid = s.loadid
		where
			s.LoadStopTypeId = 2
		group by
			c.loadid
		having
			count(c.loadid) > 2
	) subquery;














	/*
SELECT 'DRIVERZ++++++++++++++++++++++++++++++++++++++++++++++++++++' AS 'DRIVERZ'


select 
	count(distinct(PayrollOTRdriverloadchainid)) AS 'NUM CHAINS - LOADS WITH LEGS ------ (all) -----', '48' as '----CHECK WORK' from
	payroll.PayrollOTRdriverloadchain c
	join dispatch.loadstop s on c.loadid = s.loadid
	JOIN main.person p on c.personid = p.personid
where
	s.LoadStopTypeId = 2
	



		
SELECT count(*) as 'NUM CHAINS - LOADS WITH LEGS ------ (1) ------'  , '39' as '----CHECK WORK' 
	FROM (
		select 
			--count(c.loadid) as cnt
			count(distinct c.loadid) as cnt
		from
			payroll.PayrollOTRdriverloadchain c
			join dispatch.loadstop s on c.loadid = s.loadid
		where
			s.LoadStopTypeId = 2
		group by
			c.loadid
		having
			count(c.loadid) = 1
	) subquery;




		
SELECT count(*) as 'NUM CHAINS - LOADS WITH LEGS ------ (2) ------'  , '9' as '----CHECK WORK' 
	FROM (
		select 
			--count(c.loadid) as cnt
			count(distinct c.loadid) as cnt
		from
			payroll.PayrollOTRdriverloadchain c
			join dispatch.loadstop s on c.loadid = s.loadid
		where
			s.LoadStopTypeId = 2
		group by
			c.loadid
		having
			count(c.loadid) = 2
	) subquery;



		
SELECT count(*) as 'NUM CHAINS - LOADS WITH LEGS ------ (> 2) ----' , '0' as '----CHECK WORK' 
	FROM (
		select 
			--count(c.loadid) as cnt
			count(distinct c.loadid) as cnt
		from
			payroll.PayrollOTRdriverloadchain c
			join dispatch.loadstop s on c.loadid = s.loadid
		where
			s.LoadStopTypeId = 2
		group by
			c.loadid
		having
			count(c.loadid) > 2
	) subquery;
	*/




--asdf
/*
	- 1 driver, 1 pick, 1 drop
	-1 driver, 1 pick, 1->m drops
	1 driver, 1->m picks, 1 drop
	1 driver, 1->m picks, 1->m drops
	1 driver, x picks, x + y drops
	others?
*/





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


select 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXX'






/*
	select 
		blah as leg_city,
		blah as leg_state,
		asdf as driverend times.* from
		payroll.PayrollOTRdriverloadchain c
		join dispatch.loadstop s on c.loadid = s.loadid
	where
		s.LoadStopTypeId = 2
		and s.loadid = 56480
*/






--loadstop
select 'loadstop---' as 'loadstop', loadid, s.driver1_personid, StartDateTime as X, DropStartDateTime as '---------DropX---------NOT IN HISTORY?'
from
	dispatch.loadstop s
where
	(s.LoadStopTypeId <> 4) and 
	s.loadid 
	in (select distinct loadid from payroll.PayrollOTRdriverloadchain)
	--= 56480
order by 
	loadid,
	stopnumber



select 
	'history---' as 'history', loadid, driverpersonid, h.pickupby, h.DeliverBy
from
	dispatch.PR_OTR_History h
where
	loadid 
	in (select distinct loadid from payroll.PayrollOTRdriverloadchain)
	--= 56480
	and paycode = 'Per Diem'
order by
	h.PickupBy




select
	'chain---' as 'chain', loadid, personid, begindate, enddate
from
	payroll.PayrollOTRdriverloadchain
where
	loadid 
	in (select distinct loadid from payroll.PayrollOTRdriverloadchain)
	--= 56480
order by 
	loadid,
	enddate




	-----------------------------------------------------------------------










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
	----------------56357 (I may have changed this in prod?)
	56460
	56477
	----------------56480 (possible bad datain driver db)
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






