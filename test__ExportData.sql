USE [RedBoneThomas]
GO

	delete from [export].[AccountingExportPayrollData];

	--[PayPeriodId] ASC,
	--[PersonId] ASC,
	--[AccountingExportPayrollEntryTypeId] ASC,
	--[AccountingExportPayrollItemId] ASC,
	--[OriginatingOTRPayPeriodId] ASC

INSERT INTO [export].[AccountingExportPayrollData]
(PayPeriodId, PersonId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId,	OriginatingOTRPayPeriodId, PayrollOTRDataSourceId,	PayrollOTRPaymentHoldReasonId, Quantity,	LoadId)
VALUES
(1,			2775,		1,									1,								1,							1,							NULL,							5000,		100),
(2,			2775,		1,									1,								2,							1,							NULL,							5000,		100),
(2,			2775,		1,									1,								2,							1,							NULL,							5000,		100),
(3,			2775,		1,									1,								2,							1,							1,						 		5000,		100),
(3,			2775,		1,									1,								3,							1,							NULL,							5000,		100),
(NULL,		2775,		1,									1,								3,							1,							1,								5000,		100)
