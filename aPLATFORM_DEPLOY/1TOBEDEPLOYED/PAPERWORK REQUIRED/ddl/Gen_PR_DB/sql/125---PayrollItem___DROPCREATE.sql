--ALTER TABLE [payroll].[PayrollItem] DROP CONSTRAINT [FK_PayrollItem_QuickbooksCompany]
--GO

--ALTER TABLE [payroll].[PayrollOTRApiDataExport] DROP CONSTRAINT [FK_PayrollItem_PayrollOTRApiDataExportType]
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
	[QuickbooksCompanyId] [int] NOT NULL,
	[PayrollOTRApiDataExportTypeId] [int] NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollItem] PRIMARY KEY CLUSTERED 
(
	[PayrollItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollItem] UNIQUE NONCLUSTERED 
(
	[QuickbooksCompanyId] ASC,
	[PayrollOTRApiDataExportTypeId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO































ALTER TABLE [payroll].[PayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_PayrollItem_QuickbooksCompany] FOREIGN KEY([QuickbooksCompanyId])
REFERENCES [payroll].[QuickbooksCompany] ([QuickbooksCompanyId])
GO
ALTER TABLE [payroll].[PayrollItem] CHECK CONSTRAINT [FK_PayrollItem_QuickbooksCompany]
GO


ALTER TABLE [payroll].[PayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_PayrollItem_PayrollOTRApiDataExportType] FOREIGN KEY([PayrollOTRApiDataExportTypeId])
REFERENCES [payroll].[PayrollOTRApiDataExportType] ([PayrollOTRApiDataExportTypeId])
GO
ALTER TABLE [payroll].[PayrollItem] CHECK CONSTRAINT [FK_PayrollItem_PayrollOTRApiDataExportType]
GO



--TEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMP
INSERT INTO [payroll].[PayrollItem] ([QuickbooksCompanyId], [PayrollOTRApiDataExportTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 1', 1);
INSERT INTO [payroll].[PayrollItem] ([QuickbooksCompanyId], [PayrollOTRApiDataExportTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 2', 1);
