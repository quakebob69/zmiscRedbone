--loadstop
select 'loadstop' as 'loadstop', s.driver1_personid, StartDateTime as X, DropStartDateTime as '---------DropX---------NOT IN HISTORY?'--, *
from
	dispatch.loadstop s
where
	(s.LoadStopTypeId <> 4) and 
	s.loadid = 56480
order by 
	--s.loadid,
	stopnumber



select 'history' as 'history', driverpersonid, h.pickupby, h.DeliverBy from dispatch.PR_OTR_History h
where
	loadid = 56480
	and paycode = 'Per Diem'
order by
	h.PickupBy




select 'chain' as 'chain', personid, begindate, enddate, '-----------------------------'--, *--
from
	payroll.PayrollOTRdriverloadchain c
where
	loadid = 56480
order by 
	c.enddate
	--s.loadid,
	--stopnumber




	-----------------------------------------------------------------------


