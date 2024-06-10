select count(*) from payroll.PayrollOTRStaging;

delete from payroll.PayrollOTRdriverloadchain


-- bad dates
--(
select
	PayrollOTRdriverloadchainid, loadid
from
	payroll.PayrollOTRdriverloadchain
where
	enddate <= begindate
--order by 
--	personid, BeginDate
--)

