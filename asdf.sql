delete from [export].[AccountingExportPayrollData];

--1
	--new
		INSERT INTO [export].[AccountingExportPayrollData]
		(PayPeriodId, OriginatingOTRPayPeriodId, PersonId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PayrollOTRDataSourceId,	PayrollOTRPaymentHoldReasonId, Quantity,	LoadIdOrDriverPayId)
		VALUES		
			(1,								1,						2775,		1,									1,							1,							NULL,							5000,		100)
			,(1,							1,						2775,		1,									1,							1,							NULL,							5000,		101)
	


--2
	--new
		INSERT INTO [export].[AccountingExportPayrollData]
		(PayPeriodId, OriginatingOTRPayPeriodId, PersonId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PayrollOTRDataSourceId,	PayrollOTRPaymentHoldReasonId, Quantity,	LoadIdOrDriverPayId)
		VALUES		
			(2,								2,						2775,		1,									1,							1,							NULL,							5000,		200)
			,(2,							2,						2775,		1,									2,							1,							NULL,							5000,		201)
			--hold
			,(NULL,							2,						2775,		1,									1,							1,							1,								5000,		203)

	--unhold



--3
	--new
		INSERT INTO [export].[AccountingExportPayrollData]
		(PayPeriodId, OriginatingOTRPayPeriodId, PersonId, AccountingExportPayrollEntryTypeId, AccountingExportPayrollItemId, PayrollOTRDataSourceId,	PayrollOTRPaymentHoldReasonId, Quantity,	LoadIdOrDriverPayId)
		VALUES
			(3,							2,						2775,		1,									1,							1,							NULL,							5000,		100)
			,(NULL,						3,						2775,		1,									1,							1,							1,								5111,		111)

	--hold
		
	--unhold
		--select AccountingExportPayrollDataID from [export].[AccountingExportPayrollData] where AccountingExportPayPeriodId is NULL
		UPDATE [export].[AccountingExportPayrollData] SET PayPeriodId = 3 where AccountingExportPayrollDataId = 4

						



select 
	AccountingExportPayrollDataId,

	PayPeriodId,
	OriginatingOTRPayPeriodId,
	PersonId,
	AccountingExportPayrollEntryTypeId,
	AccountingExportPayrollItemId,

		PayrollOTRDataSourceId,
		PayrollOTRPaymentHoldReasonId,
		Quantity,
		LoadIdOrDriverPayId
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
	AccountingExportPayrollDataId,
	PayPeriodId,
	OriginatingOTRPayPeriodId,
	PersonId,
	AccountingExportPayrollEntryTypeId,
	AccountingExportPayrollItemId,
		PayrollOTRDataSourceId,
		PayrollOTRPaymentHoldReasonId,
		Quantity,
		LoadIdOrDriverPayId
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




