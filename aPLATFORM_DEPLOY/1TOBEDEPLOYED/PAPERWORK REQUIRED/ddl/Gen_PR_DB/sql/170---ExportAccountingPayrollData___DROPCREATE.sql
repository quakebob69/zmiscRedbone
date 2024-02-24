--ALTER TABLE [export].[AccountingExportPayrollData] DROP CONSTRAINT [FK_AccountingExportPayrollData_AccountingExportPayrollEntryType]
--GO

/****** Object:  Table [export].[AccountingExportPayrollData]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollData]') AND type in (N'U'))
DROP TABLE [export].[AccountingExportPayrollData]
GO

/****** Object:  Table [export].[AccountingExportPayrollData]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [export].[AccountingExportPayrollData](
	[AccountingExportPayrollDataId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNameWithLastFourSSN] [varchar](128) NOT NULL,
	[AccountingExportPayrollEntryTypeId] [int] NOT NULL,
	[AccountingExportPayrollItemName] [varchar](128) NOT NULL,
	[Quantity] [decimal](10, 2) NULL,
	[Rate] [decimal](10, 2) NULL
 CONSTRAINT [PK_AccountingExportPayrollData] PRIMARY KEY CLUSTERED 
(
	[AccountingExportPayrollDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AccountingExportPayrollData] UNIQUE NONCLUSTERED 
(
	[EmployeeNameWithLastFourSSN] ASC,
	[AccountingExportPayrollEntryTypeId] ASC,
	[AccountingExportPayrollItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [export].[AccountingExportPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollData_AccountingExportPayrollEntryType] FOREIGN KEY([AccountingExportPayrollEntryTypeId])
REFERENCES [export].[AccountingExportPayrollEntryType] ([AccountingExportPayrollEntryTypeId])
GO
ALTER TABLE [export].[AccountingExportPayrollData] CHECK CONSTRAINT [FK_AccountingExportPayrollData_AccountingExportPayrollEntryType]
GO

