/****** Object:  Table [payroll].[PayrollOTRBenefitsEligibility]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRBenefitsEligibility]') AND type in (N'U'))
DROP TABLE IF EXISTS [payroll].[PayrollOTRBenefitsEligibility]
GO

/****** Object:  Table [payroll].[PayrollOTRBenefitsEligibility]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRBenefitsEligibility](
	[PayrollOTRBenefitsEligibilityId] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_PayrollOTRBenefitsEligibility] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRBenefitsEligibilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRBenefitsEligibility] UNIQUE NONCLUSTERED 
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

ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_Person]
GO


ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_PayrollOTRDataSource] FOREIGN KEY([PayrollOTRDataSourceId])
REFERENCES [payroll].[PayrollOTRDataSource] ([PayrollOTRDataSourceId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_PayrollOTRDataSource]
GO


ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_OriginatingOTRPayPeriod] FOREIGN KEY([OriginatingOTRPayPeriodId])
REFERENCES [payroll].[PayrollOTRPayPeriod] ([PayrollOTRPayPeriodId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_OriginatingOTRPayPeriod]
GO

ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_PayPeriod] FOREIGN KEY([PayPeriodId])
REFERENCES [payroll].[PayrollOTRPayPeriod] ([PayrollOTRPayPeriodId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_PayPeriod]
GO


ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_AccountingExportPayrollEntryType] FOREIGN KEY([AccountingExportPayrollEntryTypeId])
REFERENCES [payroll].[AccountingExportPayrollEntryType] ([AccountingExportPayrollEntryTypeId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_AccountingExportPayrollEntryType]
GO


ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_AccountingExportPayrollItem] FOREIGN KEY([AccountingExportPayrollItemId])
REFERENCES [payroll].[AccountingExportPayrollItem] ([AccountingExportPayrollItemId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_AccountingExportPayrollItem]
GO


ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_PayrollOTRPaymentHoldReason] FOREIGN KEY([PayrollOTRPaymentHoldReasonId])
REFERENCES [payroll].[PayrollOTRPaymentHoldReason] ([PayrollOTRPaymentHoldReasonId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_PayrollOTRPaymentHoldReason]
GO
