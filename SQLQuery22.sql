select top 2000 * from dispatch.PR_OTR_History 
--where deliverby is null
order by Historyid desc




SELECT DATEADD(DAY, -1, (select BeginDate from payroll.PayrollOTRPayPeriod where IsActive = 1))
select count(*) from dispatch.PR_OTR_History 
where deliverby > DATEADD(DAY, -1, (select BeginDate from payroll.PayrollOTRPayPeriod where IsActive = 1))


