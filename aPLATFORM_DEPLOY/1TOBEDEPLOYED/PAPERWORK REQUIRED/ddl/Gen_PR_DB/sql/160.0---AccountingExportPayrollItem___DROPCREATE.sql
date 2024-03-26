--ALTER TABLE [export].[AccountingExportPayrollItem] DROP CONSTRAINT [FK_AccountingExportPayrollItem_AccountingExportCompany]
--GO

--ALTER TABLE [export].[AccountingExportPayrollItem] DROP CONSTRAINT [FK_AccountingExportPayrollItem_AccountingExportPayrollEntryType]
--GO


/****** Object:  Table [export].[AccountingExportPayrollItem]    Script Date: 2/16/2024 1:15:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollItem]') AND type in (N'U'))
DROP TABLE [export].[AccountingExportPayrollItem]
GO

/****** Object:  Table [export].[AccountingExportPayrollItem]    Script Date: 2/16/2024 1:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [export].[AccountingExportPayrollItem](
	[AccountingExportPayrollItemId] [int] IDENTITY(1,1) NOT NULL,
	[AccountingExportCompanyId] [int] NOT NULL,
	[AccountingExportPayrollEntryTypeId] [int] NOT NULL,
	[NameQB] [varchar](50) NOT NULL,
	[PayCodeLegacy] [varchar](50) NULL,
	[PayIdLegacy] int NULL,
	[Order] int NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_AccountingExportPayrollItem] PRIMARY KEY CLUSTERED 
(
	[AccountingExportPayrollItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AccountingExportPayrollItem] UNIQUE NONCLUSTERED 
(
	[AccountingExportCompanyId] ASC,
	[AccountingExportPayrollEntryTypeId] ASC,
	[NameQB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [export].[AccountingExportPayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollItem_AccountingExportCompany] FOREIGN KEY([AccountingExportCompanyId])
REFERENCES [export].[AccountingExportCompany] ([AccountingExportCompanyId])
GO
ALTER TABLE [export].[AccountingExportPayrollItem] CHECK CONSTRAINT [FK_AccountingExportPayrollItem_AccountingExportCompany]
GO


ALTER TABLE [export].[AccountingExportPayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_AccountingExportPayrollItem_AccountingExportPayrollEntryType] FOREIGN KEY([AccountingExportPayrollEntryTypeId])
REFERENCES [export].[AccountingExportPayrollEntryType] ([AccountingExportPayrollEntryTypeId])
GO
ALTER TABLE [export].[AccountingExportPayrollItem] CHECK CONSTRAINT [FK_AccountingExportPayrollItem_AccountingExportPayrollEntryType]
GO
