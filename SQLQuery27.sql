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


