USE [RedBone]
GO

delete from payroll.PayrollOTRPaymentHold;

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPaymentHold]') AND type in (N'U'))
	DROP TABLE [payroll].[PayrollOTRPaymentHold]
	GO
delete from payroll.PayrollOTRPaymentHold;


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRPaymentHold](
	[PayrollOTRPaymentHoldId] [int] IDENTITY(1,1) NOT NULL,
	[PayrollOTRPaymentHoldReasonId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[OriginatingOTRPayPeriodId] [int] NOT NULL,
 CONSTRAINT [PK_PayrollOTRPaymentHold] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRPaymentHoldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRPaymentHold] UNIQUE NONCLUSTERED 
(




	PersonId




)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [payroll].[PayrollOTRPaymentHold]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPaymentHoldReason] FOREIGN KEY([PayrollOTRPaymentHoldReasonId])
REFERENCES [payroll].[PayrollOTRPaymentHoldReason] ([PayrollOTRPaymentHoldReasonId])
GO
ALTER TABLE [payroll].[PayrollOTRPaymentHold] CHECK CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPaymentHoldReason]
GO	

ALTER TABLE [payroll].[PayrollOTRPaymentHold]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRPaymentHold_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [payroll].[PayrollOTRPaymentHold] CHECK CONSTRAINT [FK_PayrollOTRPaymentHold_Person]
GO	

ALTER TABLE [payroll].[PayrollOTRPaymentHold]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPayPeriod] FOREIGN KEY([OriginatingOTRPayPeriodId])
REFERENCES [payroll].[PayrollOTRPayPeriod] ([PayrollOTRPayPeriodId])
GO
ALTER TABLE [payroll].[PayrollOTRPaymentHold] CHECK CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPayPeriod]
GO	

-----------------------------------------
INSERT INTO [payroll].[PayrollOTRPaymentHold] ([PayrollOTRPaymentHoldReasonId], [PersonId], [OriginatingOTRPayPeriodId]) VALUES (1, 8, 1);
INSERT INTO [payroll].[PayrollOTRPaymentHold] ([PayrollOTRPaymentHoldReasonId], [PersonId], [OriginatingOTRPayPeriodId]) VALUES (1, 8, 1);
--INSERT INTO [payroll].[PayrollOTRPaymentHold] ([PayrollOTRPaymentHoldReasonId]) VALUES (1);
