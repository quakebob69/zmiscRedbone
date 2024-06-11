select count(*) from payroll.PayrollOTRStaging;

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



