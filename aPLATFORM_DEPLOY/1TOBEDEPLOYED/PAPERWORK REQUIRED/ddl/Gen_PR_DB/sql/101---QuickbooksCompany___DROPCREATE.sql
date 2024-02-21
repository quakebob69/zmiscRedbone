/****** Object:  Table [payroll].[ExportAccountingCompany]    Script Date: 2/14/2024 1:12:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[ExportAccountingCompany]') AND type in (N'U'))
DROP TABLE [payroll].[ExportAccountingCompany]
GO

/****** Object:  Table [payroll].[ExportAccountingCompany]    Script Date: 2/14/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[ExportAccountingCompany](
	[ExportAccountingCompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NOT NULL
 CONSTRAINT [PK_ExportAccountingCompany] PRIMARY KEY CLUSTERED 
(
	[ExportAccountingCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ExportAccountingCompany] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [payroll].[ExportAccountingCompany] ([ExportAccountingCompanyId], [Name], [Description]) VALUES (1, 'REDBONE', 'OTR, Local Drivers, Diesel Shop');
INSERT INTO [payroll].[ExportAccountingCompany] ([ExportAccountingCompanyId], [Name], [Description]) VALUES (2, 'DOUBLEDOWN', 'FedEx, Admin');
