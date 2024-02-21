/****** Object:  Table [payroll].[AccountingPayrollEntryType]    Script Date: 2/16/2024 1:16:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[AccountingPayrollEntryType]') AND type in (N'U'))
DROP TABLE [payroll].[AccountingPayrollEntryType]
GO

/****** Object:  Table [payroll].[AccountingPayrollEntryType]    Script Date: 2/16/2024 1:16:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[AccountingPayrollEntryType](
	[AccountingPayrollEntryTypeId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_AccountingPayrollEntryType] PRIMARY KEY CLUSTERED 
(
	[AccountingPayrollEntryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AccountingPayrollEntryType] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [payroll].[AccountingPayrollEntryType] ([AccountingPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 'EARNINGS', 1);
INSERT INTO [payroll].[AccountingPayrollEntryType] ([AccountingPayrollEntryTypeId], [Name], [Enabled]) VALUES (2, 'OTHERPAYROLLITEMS', 1);
