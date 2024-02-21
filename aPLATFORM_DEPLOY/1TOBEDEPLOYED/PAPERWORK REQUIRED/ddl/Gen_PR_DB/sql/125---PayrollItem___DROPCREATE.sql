--ALTER TABLE [payroll].[PayrollItem] DROP CONSTRAINT [FK_PayrollItem_AccountingCompany]
--GO

--ALTER TABLE [payroll].[PayrollItem] DROP CONSTRAINT [FK_PayrollItem_AccountingPayrollEntryType]
--GO


/****** Object:  Table [payroll].[PayrollItem]    Script Date: 2/16/2024 1:15:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollItem]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollItem]
GO

/****** Object:  Table [payroll].[PayrollItem]    Script Date: 2/16/2024 1:15:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollItem](
	[PayrollItemId] [int] IDENTITY(1,1) NOT NULL,
	[AccountingCompanyId] [int] NOT NULL,
	[AccountingPayrollEntryTypeId] [int] NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollItem] PRIMARY KEY CLUSTERED 
(
	[PayrollItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollItem] UNIQUE NONCLUSTERED 
(
	[AccountingCompanyId] ASC,
	[AccountingPayrollEntryTypeId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [payroll].[PayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_PayrollItem_AccountingCompany] FOREIGN KEY([AccountingCompanyId])
REFERENCES [payroll].[AccountingCompany] ([AccountingCompanyId])
GO
ALTER TABLE [payroll].[PayrollItem] CHECK CONSTRAINT [FK_PayrollItem_AccountingCompany]
GO


ALTER TABLE [payroll].[PayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_PayrollItem_AccountingPayrollEntryType] FOREIGN KEY([AccountingPayrollEntryTypeId])
REFERENCES [payroll].[AccountingPayrollEntryType] ([AccountingPayrollEntryTypeId])
GO
ALTER TABLE [payroll].[PayrollItem] CHECK CONSTRAINT [FK_PayrollItem_AccountingPayrollEntryType]
GO



--TEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMP
INSERT INTO [payroll].[PayrollItem] ([AccountingCompanyId], [AccountingPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 1', 1);
INSERT INTO [payroll].[PayrollItem] ([AccountingCompanyId], [AccountingPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 2', 1);
