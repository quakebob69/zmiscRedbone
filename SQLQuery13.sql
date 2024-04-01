SELECT OriginatingOTRPayPeriodId, payrollOTRDATasourceid,  AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, count(*) as 'count'
  FROM [RedBoneThomas].[export].[AccountingExportPayrollData] 
  GROUP by OriginatingOTRPayPeriodId, payrollOTRDATasourceid, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId
  order by OriginatingOTRPayPeriodId, payrollOTRDATasourceid, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId
  
  
SELECT p.FirstName, p.LastName, itm.nameQB, Rate, Quantity, hours
  FROM [RedBoneThomas].[export].[AccountingExportPayrollData] axpd
  JOIN MAIN.Person P ON  p.PersonId = axpd.PersonId
  JOIN export.AccountingExportPayrollItem itm ON  itm.AccountingExportPayrollItemId = axpd.AccountingExportPayrollItemId
  where p.lastname like '%GRIFFITH%'
  order by OriginatingOTRPayPeriodId, payrollOTRDATasourceid, p.FirstName, p.LastName, itm.AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId
  

SELECT p.FirstName, p.LastName, itm.nameQB, Rate, Quantity, hours, *
  FROM [RedBoneThomas].[export].[AccountingExportPayrollData] axpd
  JOIN MAIN.Person P ON  p.PersonId = axpd.PersonId
  JOIN export.AccountingExportPayrollItem itm ON  itm.AccountingExportPayrollItemId = axpd.AccountingExportPayrollItemId
  --where p.lastname like '%GRIFFITH%'
  order by OriginatingOTRPayPeriodId, payrollOTRDATasourceid, p.FirstName, p.LastName, itm.AccountingExportPayrollEntryTypeId, itm.AccountingExportPayrollItemId
  




  /*
  SELECT *
  FROM [RedBoneThomas].[payroll].[PayrollOTRStaging]  
  where DriverPersonId = 2496

  SELECT *
  FROM [RedBoneThomas].[payroll].vPayrollOTRStaging___withpersonsremoved  where DriverPersonId = 2496
  */
