--ALTER TABLE [export].[ExportAccountingPayrollData] DROP CONSTRAINT [FK_ExportAccountingPayrollData_ExportAccountingPayrollEntryType]
--GO

/****** Object:  Table [export].[ExportAccountingPayrollData]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[ExportAccountingPayrollData]') AND type in (N'U'))
DROP TABLE [export].[ExportAccountingPayrollData]
GO

/****** Object:  Table [export].[ExportAccountingPayrollData]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [export].[ExportAccountingPayrollData](
	[ExportAccountingPayrollDataId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNameWithLastFourSSN] [varchar](128) NOT NULL,
	[ExportAccountingPayrollEntryTypeId] [int] NOT NULL,
	[ExportAccountingPayrollItemName] [varchar](128) NOT NULL,
	[Quantity] [decimal](10, 2) NULL,
	[Rate] [decimal](10, 2) NULL
 CONSTRAINT [PK_ExportAccountingPayrollData] PRIMARY KEY CLUSTERED 
(
	[ExportAccountingPayrollDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ExportAccountingPayrollData] UNIQUE NONCLUSTERED 
(
	[EmployeeNameWithLastFourSSN] ASC,
	[ExportAccountingPayrollEntryTypeId] ASC,
	[ExportAccountingPayrollItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [export].[ExportAccountingPayrollData]  WITH CHECK ADD  CONSTRAINT [FK_ExportAccountingPayrollData_ExportAccountingPayrollEntryType] FOREIGN KEY([ExportAccountingPayrollEntryTypeId])
REFERENCES [export].[ExportAccountingPayrollEntryType] ([ExportAccountingPayrollEntryTypeId])
GO
ALTER TABLE [export].[ExportAccountingPayrollData] CHECK CONSTRAINT [FK_ExportAccountingPayrollData_ExportAccountingPayrollEntryType]
GO

