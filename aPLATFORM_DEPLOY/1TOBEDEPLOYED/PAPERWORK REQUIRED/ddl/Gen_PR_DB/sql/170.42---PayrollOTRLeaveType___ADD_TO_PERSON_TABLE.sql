SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER TABLE [main].[Person]
	ADD [PayrollOTRLeaveTypeId] [int] NULL
GO


ALTER TABLE [main].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PayrollOTRLeaveType] FOREIGN KEY([PayrollOTRLeaveTypeId])
REFERENCES [payroll].[PayrollOTRLeaveType] ([PayrollOTRLeaveTypeId])
GO
ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_PayrollOTRLeaveType]
GO
