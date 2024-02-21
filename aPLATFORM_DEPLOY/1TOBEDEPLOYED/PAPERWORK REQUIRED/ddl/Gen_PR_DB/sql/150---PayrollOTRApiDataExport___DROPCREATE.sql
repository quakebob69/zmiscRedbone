--ALTER TABLE [payroll].[ExportAccountingPayroll] DROP CONSTRAINT [FK_ExportAccountingPayroll_AccountingPayrollEntryType]
--GO

/****** Object:  Table [payroll].[ExportAccountingPayroll]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[ExportAccountingPayroll]') AND type in (N'U'))
DROP TABLE [payroll].[ExportAccountingPayroll]
GO

/****** Object:  Table [payroll].[ExportAccountingPayroll]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[ExportAccountingPayroll](
	[ExportAccountingPayrollId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNameWithLastFourSSN] [varchar](128) NOT NULL,
	[AccountingPayrollEntryTypeId] [int] NOT NULL,
	[PayrollItemName] [varchar](128) NOT NULL,
	[Quantity] [decimal](10, 2) NULL,
	[Rate] [decimal](10, 2) NULL
 CONSTRAINT [PK_ExportAccountingPayroll] PRIMARY KEY CLUSTERED 
(
	[ExportAccountingPayrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ExportAccountingPayroll] UNIQUE NONCLUSTERED 
(
	[EmployeeNameWithLastFourSSN] ASC,
	[AccountingPayrollEntryTypeId] ASC,
	[PayrollItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [payroll].[ExportAccountingPayroll]  WITH CHECK ADD  CONSTRAINT [FK_ExportAccountingPayroll_AccountingPayrollEntryType] FOREIGN KEY([AccountingPayrollEntryTypeId])
REFERENCES [payroll].[AccountingPayrollEntryType] ([AccountingPayrollEntryTypeId])
GO
ALTER TABLE [payroll].[ExportAccountingPayroll] CHECK CONSTRAINT [FK_ExportAccountingPayroll_AccountingPayrollEntryType]
GO

