--'history missing pickupby or DeliverBy'
--X recs in prod as of 6/11
select 
	'history missing pickupby or DeliverBy', loadid, driverpersonid, h.pickupby, h.DeliverBy
from
	dispatch.PR_OTR_History h
where
	pickupby is null
	or 
	DeliverBy is null
	and paycode = 'Per Diem'
order by
	pickupby desc,
	DeliverBy desc
	


--loadstop missing stop dates
	--(56681, 57234)
select distinct(loadid) as 'loadstop missing stop dates+++'
from
	dispatch.loadstop s
where
	(s.LoadStopTypeId <> 4) and 
	s.loadid in (select distinct loadid from payroll.PayrollOTRdriverloadchain) and
	StartDateTime is null
order by
	s.loadid 






--history missing stop dates
select 
	'history (corresponding missing stop dates)+++', loadid, driverpersonid, h.pickupby, h.DeliverBy
from
	dispatch.PR_OTR_History h
where
	loadid 
	in (
		select distinct(loadid) 
		from
			dispatch.loadstop s
		where
			(s.LoadStopTypeId <> 4) and 
			s.loadid in (select distinct loadid from payroll.PayrollOTRdriverloadchain) and
			StartDateTime is null

	)
	and paycode = 'Per Diem'
order by
	loadid 







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


