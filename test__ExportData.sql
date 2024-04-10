
USE [RedBoneThomas]
GO

	delete from [export].[AccountingExportPayrollData];
		--[PayPeriodId] ASC,
		--[PersonId] ASC,
		--[AccountingExportPayrollEntryTypeId] ASC,
		--[AccountingExportPayrollItemId] ASC,
		--[OriginatingOTRPayPeriodId] ASC







INSERT INTO [export].[AccountingExportPayrollData]
(PayPeriodId, OriginatingOTRPayPeriodId, PersonId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PayrollOTRDataSourceId,	PayrollOTRPaymentHoldReasonId, Quantity,	LoadId)
VALUES		
(1,								1,						2775,		1,									1,							1,							NULL,							5000,		100)



INSERT INTO [export].[AccountingExportPayrollData]
(PayPeriodId, OriginatingOTRPayPeriodId, PersonId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PayrollOTRDataSourceId,	PayrollOTRPaymentHoldReasonId, Quantity,	LoadId)
VALUES		
(2,							2,						2775,		1,									1,							1,							NULL,							5000,		100)
,(2,							2,						2775,		1,									2,							1,							NULL,							5000,		100)
,(NULL,							2,						2775,		1,									1,							1,							1,								5000,		100)



delete from [export].[AccountingExportPayrollData] where AccountingExportPayrollDataId = (select top 1 AccountingExportPayrollDataId from [export].[AccountingExportPayrollData] order by AccountingExportPayrollDataId desc)
	INSERT INTO [export].[AccountingExportPayrollData]
	(PayPeriodId, OriginatingOTRPayPeriodId, PersonId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PayrollOTRDataSourceId,	PayrollOTRPaymentHoldReasonId, Quantity,	LoadId)
	VALUES		
(3,							2,						2775,		1,									1,							1,							1,								5000,		100)
,(3,							3,						2775,		1,									1,							1,							NULL,							5000,		100)
,(NULL,							3,						2775,		1,									1,							1,							1,								5000,		100)






select 
	PayPeriodId,
	OriginatingOTRPayPeriodId,
	PersonId,
	AccountingExportPayrollEntryTypeId,
	AccountingExportPayrollItemId,
		PayrollOTRDataSourceId,
		PayrollOTRPaymentHoldReasonId,
		Quantity,
		LoadId
from
	[export].[AccountingExportPayrollData]
where
	PayPeriodId is not NULL
order by 
	PayPeriodId,
	OriginatingOTRPayPeriodId,
	PersonId,
	AccountingExportPayrollEntryTypeId,
	AccountingExportPayrollItemId

select 
	PayPeriodId,
	OriginatingOTRPayPeriodId,
	PersonId,
	AccountingExportPayrollEntryTypeId,
	AccountingExportPayrollItemId,
		PayrollOTRDataSourceId,
		PayrollOTRPaymentHoldReasonId,
		Quantity,
		LoadId
from
	[export].[AccountingExportPayrollData]
where
	PayPeriodId is NULL
order by 
	PayPeriodId,
	OriginatingOTRPayPeriodId,
	PersonId,
	AccountingExportPayrollEntryTypeId,
	AccountingExportPayrollItemId

