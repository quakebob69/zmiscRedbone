SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [main].[Person]
ADD [PayrollOTRPersonLeaveTypeId] [int] NULL CONSTRAINT DF_mainPerson_PayrollOTRPersonLeaveTypeId DEFAULT 0
GO

ALTER TABLE [main].[Person] WITH CHECK ADD  CONSTRAINT [FK_Person_PayrollOTRPersonLeaveType] FOREIGN KEY([PayrollOTRPersonLeaveTypeId])
REFERENCES [payroll].[PayrollOTRPersonLeaveType] ([PayrollOTRPersonLeaveTypeId])
GO
ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_PayrollOTRPersonLeaveType]
GO
