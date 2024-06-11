--select count(*) from payroll.PayrollOTRStaging;

--delete from payroll.PayrollOTRdriverloadchain


-- bad dates
select
	count(*)
from
	payroll.PayrollOTRdriverloadchain
where
	enddate <= begindate



--all
select
	count(*)
from
	payroll.PayrollOTRdriverloadchain


select
	*
from
	payroll.PayrollOTRdriverloadchain
ORDER by
	personid, enddate


	select count(distinct loadid) from dispatch.loadstop where loadid in 

(
	select
	loadid
from
	payroll.PayrollOTRdriverloadchain
--ORDER by
	--personid, enddate
	)

	and dispatch.loadstop.LoadStopTypeId = 2;
