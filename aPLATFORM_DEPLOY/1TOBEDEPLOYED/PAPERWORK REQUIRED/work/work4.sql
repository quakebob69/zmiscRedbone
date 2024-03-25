USE [RedBoneThomas]
GO

/*
SELECT TOP (1000) 
[AccountingExportPayrollDataId]
      ,[PersonId]
      ,[OriginatingOTRPayPeriodId]
      ,[AccountingExportPayrollEntryTypeId]
      ,[AccountingExportPayrollItemId]
      ,[Quantity]
      ,[Rate]
      ,[PayrollOTRPaymentHoldReasonId]
      ,[HeldPaymentHasBeenPaid]
  FROM [RedBoneThomas].[export].[AccountingExportPayrollData]
  */

  sp_Payroll_OTR_PayPeriodGetOpen