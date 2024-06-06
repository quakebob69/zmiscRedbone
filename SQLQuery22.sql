/*
select top 2000 * from dispatch.PR_OTR_History 
--where deliverby is null
order by Historyid desc





SELECT DATEADD(DAY, -1, (select BeginDate from payroll.PayrollOTRPayPeriod where IsActive = 1))
select count(*) from dispatch.PR_OTR_History 
where deliverby > DATEADD(DAY, -1, (select BeginDate from payroll.PayrollOTRPayPeriod where IsActive = 1))


select distinct DriverPersonId from payroll.PayrollOTRStaging 

select * from dispatch.

*/



declare @driverId int set @driverId = 1708


		--select distinct DriverPersonId from payroll.PayrollOTRStaging

		
		--select * from main.person where FirstName like '%%' and  LastName like'%Encer%'

		/*
		2451
2717
2656
1708
2451
2778
2694
2755
2154
1410
		select DISTINCT(S.DriverPersonId), suM(S.Quantity) AS MILEZ from payroll.PayrollOTRStaging s --join dispatch.PR_OTR_History h on s.DriverPersonId = h.DriverPersonId
		WHERE S.PAYID = 84
		GROUP BY s.DriverPersonId, s.Quantity
		ORDER BY MILEZ DESC
		*/



		--select count(*) from dispatch.load where Driver1_PersonId = @driverId
			--select loadid from dispatch.load where Driver1_PersonId = @driverId

				select distinct(LoadId) HOPEFULLYNORECRODSFOUND from dispatch.PR_OTR_History where  DriverPersonId = @driverId
				and loadid not in (select LoadId from dispatch.PR_OTR_History h where  DriverPersonId = @driverId and payid = 84)
				order by loadid


				 select LoadId HOPEFULLYNORECRODSFOUND, * from dispatch.PR_OTR_History where loadid in (
				 				select distinct(LoadId) from dispatch.PR_OTR_History where  DriverPersonId = @driverId
				and loadid not in (select LoadId from dispatch.PR_OTR_History h where  DriverPersonId = @driverId and payid = 84)
				--order by loadid
				)
				and DriverPersonId = @driverId
				
				






				
				select LoadId, *  from dispatch.PR_OTR_History h where  DriverPersonId = @driverId  
				and payid = 84
				 order by h.loadid

				 
				 select Driver1_PersonId  from dispatch.load where loadid in (
				 				select distinct(LoadId) from dispatch.PR_OTR_History where  DriverPersonId = @driverId
				and loadid not in (select LoadId from dispatch.PR_OTR_History h where  DriverPersonId = @driverId and payid = 84)
				--order by loadid
				)


				select loadid, Driver1_PersonId, *  from dispatch.LoadStop where loadid in (
				 				select distinct(LoadId) from dispatch.PR_OTR_History where  DriverPersonId = @driverId
				and loadid not in (select LoadId from dispatch.PR_OTR_History h where  DriverPersonId = @driverId and payid = 84) and Driver1_PersonId is not null
				--order by loadid
				)
				and Driver1_PersonId = @driverId
				








