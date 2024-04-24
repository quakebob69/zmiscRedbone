
select * from export.AccountingExportPayrollData where LoadIdOrDriverPayId in (
	SELECT
		loadid
	FROM
		dispatch.LoadStop
	WHERE
		(StartDateTime >= DATEADD(day, -4, (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)))
 and


	loadid	not in (
	SELECT
		loadid
	FROM
		dispatch.LoadStop
	WHERE
		(StartDateTime >= DATEADD(day, -3, (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)))

		))
			ORDER BY
		LoadId




						select Driver1_PersonId, Driver2_PersonId from dispatch.Load where loadid = 56716
						select StartDateTime, DropStartDateTime, Driver1_PersonId, Driver2_PersonId, * from dispatch.LoadStop where loadid = 56716 order by stopnumber
						select loadid, driverpersonid, quantity from dispatch.PR_OTR_HISTORY  where paycode = 'Per Diem' and loadid = 56716
						
							select loadidordriverpayid, personid, quantity from export.AccountingExportPayrollData where AccountingExportPayrollEntryTypeId = 1 and loadidordriverpayid = 56716

						--
						--56716	2720	438.00


select * from dispatch.LoadApptType


select count(*) from export.AccountingExportPayrollData where LoadIdOrDriverPayId = 56523
select count(*) from export.AccountingExportPayrollData
--select distinct(loadidordriverpayid) from export.AccountingExportPayrollData WHERE PayrollOTRDataSourceId = 1;


select top 1 loadid from dispatch.LoadStop where StartDateTime > (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod) order by loadid asc
select top 1 loadid from dispatch.LoadStop where DropStartDateTime > (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod) order by loadid asc

/*
56716
56764
56768
*/
