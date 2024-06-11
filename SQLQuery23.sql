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





select loadid, count(loadid) as numlegs from dispatch.loadstop
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
		count(loadid) = 1
		;

/*
--1 leg
	asdf

--2 legs:
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






