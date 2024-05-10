SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [main].[Person]
ADD [PayrollOTRBenefitsStatusId] [int] NULL
GO

ALTER TABLE [main].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PayrollOTRBenefitsStatus] FOREIGN KEY([PayrollOTRBenefitsStatusId])
REFERENCES [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId])
GO
ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_PayrollOTRBenefitsStatus]
GO
