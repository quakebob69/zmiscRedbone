/****** Object:  Table [payroll].[PayrollOTRApiDataExport]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRApiDataExport]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRApiDataExport]
GO

/****** Object:  Table [payroll].[PayrollOTRApiDataExport]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRApiDataExport](
	[PayrollOTRApiDataExportId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[PayrollOTRApiDataExportTypeId] [int] NOT NULL,
	[PayrollItemName] [varchar](128) NOT NULL,
	[Quantity] [decimal](10, 2) NULL,
	[Rate] [decimal](10, 2) NULL
 CONSTRAINT [PK_PayrollOTRApiDataExport] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRApiDataExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [payroll].[PayrollOTRApiDataExport]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRApiDataExport_PayrollOTRApiDataExportType] FOREIGN KEY([PayrollOTRApiDataExportTypeId])
REFERENCES [payroll].[PayrollOTRApiDataExportType] ([PayrollOTRApiDataExportTypeId])
GO

ALTER TABLE [payroll].[PayrollOTRApiDataExport] CHECK CONSTRAINT [FK_PayrollOTRApiDataExport_PayrollOTRApiDataExportType]
GO

