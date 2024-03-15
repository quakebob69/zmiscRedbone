/****** Object:  Table [export].[AccountingExportPayrollEntryType]    Script Date: 2/16/2024 1:16:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollEntryType]') AND type in (N'U'))
DROP TABLE [export].[AccountingExportPayrollEntryType]
GO

/****** Object:  Table [export].[AccountingExportPayrollEntryType]    Script Date: 2/16/2024 1:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [export].[AccountingExportPayrollEntryType](
	[AccountingExportPayrollEntryTypeId] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_AccountingExportPayrollEntryType] PRIMARY KEY CLUSTERED 
(
	[AccountingExportPayrollEntryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AccountingExportPayrollEntryType] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [export].[AccountingExportPayrollEntryType] ([AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 'EARNINGS', 1);
INSERT INTO [export].[AccountingExportPayrollEntryType] ([AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (2, 'OTHERPAYROLLITEMS', 1);
