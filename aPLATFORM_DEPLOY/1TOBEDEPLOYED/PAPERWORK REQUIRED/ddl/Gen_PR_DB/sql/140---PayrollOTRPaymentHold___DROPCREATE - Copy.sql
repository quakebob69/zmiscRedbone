USE [RedBone]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRPaymentHold](
	[PayrollOTRPaymentHoldId] [int] IDENTITY(1,1) NOT NULL,
	[PayrollOTRPaymentHoldReasonId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[originatingPayPeriodId] [int] NOT NULL,
 CONSTRAINT [PK_PayrollOTRPaymentHold] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRPaymentHoldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRPaymentHold] UNIQUE NONCLUSTERED 
(
	[PayrollOTRPaymentHoldReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [payroll].[PayrollOTRPaymentHold]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPaymentHoldReason] FOREIGN KEY([PayrollOTRPaymentHoldReasonId])
REFERENCES [payroll].[PayrollOTRPaymentHoldReason] ([PayrollOTRPaymentHoldReasonId])
GO
ALTER TABLE [payroll].[PayrollOTRPaymentHold] CHECK CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPaymentHoldReason]
GO	


ALTER TABLE [payroll].[PayrollOTRPaymentHold]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPaymentHoldReason] FOREIGN KEY([PayrollOTRPaymentHoldReasonId])
REFERENCES [payroll].[PayrollOTRPaymentHoldReason] ([PayrollOTRPaymentHoldReasonId])
GO
ALTER TABLE [payroll].[PayrollOTRPaymentHold] CHECK CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPaymentHoldReason]
GO	


ALTER TABLE [payroll].[PayrollOTRPaymentHold]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPaymentHoldReason] FOREIGN KEY([PayrollOTRPaymentHoldReasonId])
REFERENCES [payroll].[PayrollOTRPaymentHoldReason] ([PayrollOTRPaymentHoldReasonId])
GO
ALTER TABLE [payroll].[PayrollOTRPaymentHold] CHECK CONSTRAINT [FK_PayrollOTRPaymentHold_PayrollOTRPaymentHoldReason]
GO	

-----------------------------------------
INSERT INTO [payroll].[PayrollOTRPaymentHold] ([PayrollOTRPaymentHoldReasonId]) VALUES (1);
INSERT INTO [payroll].[PayrollOTRPaymentHold] ([PayrollOTRPaymentHoldReasonId]) VALUES (1);
