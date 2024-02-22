/****** Object:  Table [export].[AccountingExportCompany]    Script Date: 2/14/2024 1:12:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportCompany]') AND type in (N'U'))
DROP TABLE [export].[AccountingExportCompany]
GO

/****** Object:  Table [export].[AccountingExportCompany]    Script Date: 2/14/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [export].[AccountingExportCompany](
	[AccountingExportCompanyId] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](128) NOT NULL
 CONSTRAINT [PK_AccountingExportCompany] PRIMARY KEY CLUSTERED 
(
	[AccountingExportCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AccountingExportCompany] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [export].[AccountingExportCompany] ([AccountingExportCompanyId], [Name], [Description]) VALUES (1, 'REDBONE', 'OTR, Local Drivers, Diesel Shop');
INSERT INTO [export].[AccountingExportCompany] ([AccountingExportCompanyId], [Name], [Description]) VALUES (2, 'DOUBLEDOWN', 'FedEx, Admin');
