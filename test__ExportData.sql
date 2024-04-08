USE [RedBoneThomas]
GO

	delete from [export].[AccountingExportPayrollData];



INSERT INTO [export].[AccountingExportPayrollData]
	(PayPeriodId, PersonId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, OriginatingOTRPayPeriodId,	PayrollOTRDataSourceId,	PayrollOTRPaymentHoldReasonId, Quantity, LoadId)
VALUES
	(1,2775,	1,									1,								1,					1,1,							5000,			100)

