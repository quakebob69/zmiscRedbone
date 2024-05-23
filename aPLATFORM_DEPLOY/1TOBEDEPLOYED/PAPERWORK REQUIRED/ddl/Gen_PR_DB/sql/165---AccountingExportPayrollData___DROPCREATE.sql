--ALTER TABLE [export].[AccountingExportPayrollData] DROP CONSTRAINT [FK_AccountingExportPayrollData_AccountingExportPayrollEntryType]
--GO

/****** Object:  Table [export].[AccountingExportPayrollData]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollData]') AND type in (N'U'))
DROP TABLE [export].[AccountingExportPayrollData]
GO

/****** Object:  Table [export].[AccountingExportPayrollData]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [export].[AccountingExportPayrollData](
	[AccountingExportPayrollDataId] [int] IDENTITY(1,1) NOT NULL,
	[PayPeriodId] [int] NULL,
	[PersonId] [int] NOT NULL,
	[AccountingExportPayrollEntryTypeId] [int] NOT NULL,
	[AccountingExportPayrollItemId] [int] NOT NULL,
	[OriginatingOTRPayPeriodId] [int] NOT NULL,
	[LoadIdOrDriverPayId] [int] NOT NULL,
	[PayrollOTRDataSourceId] [int] NOT NULL,
	[PayrollOTRPaymentHoldReasonId] [int] NULL,
	[Rate] [decimal](10, 2) NULL,
	[Hours] [decimal](10, 2) NULL,
	[Quantity] [decimal](10, 2) NULL,
 CONSTRAINT [PK_AccountingExportPayrollData] PRIMARY KEY CLUSTERED 
(
	[AccountingExportPayrollDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AccountingExportPayrollData] UNIQUE NONCLUSTERED 
(
	[PayPeriodId],
	[PersonId],
	[AccountingExportPayrollEntryTypeId],
	[AccountingExportPayrollItemId],
	[OriginatingOTRPayPeriodId],
	[LoadIdOrDriverPayId]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [export].[AccountingExportPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollData_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [export].[AccountingExportPayrollData] CHECK CONSTRAINT [FK_AccountingExportPayrollData_Person]
GO


ALTER TABLE [export].[AccountingExportPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollData_PayrollOTRDataSource] FOREIGN KEY([PayrollOTRDataSourceId])
REFERENCES [payroll].[PayrollOTRDataSource] ([PayrollOTRDataSourceId])
GO
ALTER TABLE [export].[AccountingExportPayrollData] CHECK CONSTRAINT [FK_AccountingExportPayrollData_PayrollOTRDataSource]
GO


ALTER TABLE [export].[AccountingExportPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollData_OriginatingOTRPayPeriod] FOREIGN KEY([OriginatingOTRPayPeriodId])
REFERENCES [payroll].[PayrollOTRPayPeriod] ([PayrollOTRPayPeriodId])
GO
ALTER TABLE [export].[AccountingExportPayrollData] CHECK CONSTRAINT [FK_AccountingExportPayrollData_OriginatingOTRPayPeriod]
GO

ALTER TABLE [export].[AccountingExportPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollData_PayPeriod] FOREIGN KEY([PayPeriodId])
REFERENCES [payroll].[PayrollOTRPayPeriod] ([PayrollOTRPayPeriodId])
GO
ALTER TABLE [export].[AccountingExportPayrollData] CHECK CONSTRAINT [FK_AccountingExportPayrollData_PayPeriod]
GO


ALTER TABLE [export].[AccountingExportPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollData_AccountingExportPayrollEntryType] FOREIGN KEY([AccountingExportPayrollEntryTypeId])
REFERENCES [export].[AccountingExportPayrollEntryType] ([AccountingExportPayrollEntryTypeId])
GO
ALTER TABLE [export].[AccountingExportPayrollData] CHECK CONSTRAINT [FK_AccountingExportPayrollData_AccountingExportPayrollEntryType]
GO


ALTER TABLE [export].[AccountingExportPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollData_AccountingExportPayrollItem] FOREIGN KEY([AccountingExportPayrollItemId])
REFERENCES [export].[AccountingExportPayrollItem] ([AccountingExportPayrollItemId])
GO
ALTER TABLE [export].[AccountingExportPayrollData] CHECK CONSTRAINT [FK_AccountingExportPayrollData_AccountingExportPayrollItem]
GO


ALTER TABLE [export].[AccountingExportPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollData_PayrollOTRPaymentHoldReason] FOREIGN KEY([PayrollOTRPaymentHoldReasonId])
REFERENCES [payroll].[PayrollOTRPaymentHoldReason] ([PayrollOTRPaymentHoldReasonId])
GO
ALTER TABLE [export].[AccountingExportPayrollData] CHECK CONSTRAINT [FK_AccountingExportPayrollData_PayrollOTRPaymentHoldReason]
GO
