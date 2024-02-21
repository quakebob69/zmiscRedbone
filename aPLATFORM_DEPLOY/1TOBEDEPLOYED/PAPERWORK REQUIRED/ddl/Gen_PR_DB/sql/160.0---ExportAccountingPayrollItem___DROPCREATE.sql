--ALTER TABLE [payroll].[ExportAccountingPayrollItem] DROP CONSTRAINT [FK_ExportAccountingPayrollItem_ExportAccountingCompany]
--GO

--ALTER TABLE [payroll].[ExportAccountingPayrollItem] DROP CONSTRAINT [FK_ExportAccountingPayrollItem_ExportAccountingPayrollEntryType]
--GO


/****** Object:  Table [payroll].[ExportAccountingPayrollItem]    Script Date: 2/16/2024 1:15:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[ExportAccountingPayrollItem]') AND type in (N'U'))
DROP TABLE [payroll].[ExportAccountingPayrollItem]
GO

/****** Object:  Table [payroll].[ExportAccountingPayrollItem]    Script Date: 2/16/2024 1:15:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[ExportAccountingPayrollItem](
	[ExportAccountingPayrollItemId] [int] IDENTITY(1,1) NOT NULL,
	[ExportAccountingCompanyId] [int] NOT NULL,
	[ExportAccountingPayrollEntryTypeId] [int] NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_ExportAccountingPayrollItem] PRIMARY KEY CLUSTERED 
(
	[ExportAccountingPayrollItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ExportAccountingPayrollItem] UNIQUE NONCLUSTERED 
(
	[ExportAccountingCompanyId] ASC,
	[ExportAccountingPayrollEntryTypeId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [payroll].[ExportAccountingPayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_ExportAccountingPayrollItem_ExportAccountingCompany] FOREIGN KEY([ExportAccountingCompanyId])
REFERENCES [payroll].[ExportAccountingCompany] ([ExportAccountingCompanyId])
GO
ALTER TABLE [payroll].[ExportAccountingPayrollItem] CHECK CONSTRAINT [FK_ExportAccountingPayrollItem_ExportAccountingCompany]
GO


ALTER TABLE [payroll].[ExportAccountingPayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_ExportAccountingPayrollItem_ExportAccountingPayrollEntryType] FOREIGN KEY([ExportAccountingPayrollEntryTypeId])
REFERENCES [payroll].[ExportAccountingPayrollEntryType] ([ExportAccountingPayrollEntryTypeId])
GO
ALTER TABLE [payroll].[ExportAccountingPayrollItem] CHECK CONSTRAINT [FK_ExportAccountingPayrollItem_ExportAccountingPayrollEntryType]
GO
