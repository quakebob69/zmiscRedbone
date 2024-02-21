/****** Object:  Table [payroll].[AccountingCompany]    Script Date: 2/14/2024 1:12:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[AccountingCompany]') AND type in (N'U'))
DROP TABLE [payroll].[AccountingCompany]
GO

/****** Object:  Table [payroll].[AccountingCompany]    Script Date: 2/14/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[AccountingCompany](
	[AccountingCompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NOT NULL
 CONSTRAINT [PK_AccountingCompany] PRIMARY KEY CLUSTERED 
(
	[AccountingCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AccountingCompany] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [payroll].[AccountingCompany] ([AccountingCompanyId], [Name], [Description]) VALUES (1, 'REDBONE', 'OTR, Local Drivers, Diesel Shop');
INSERT INTO [payroll].[AccountingCompany] ([AccountingCompanyId], [Name], [Description]) VALUES (2, 'DOUBLEDOWN', 'FedEx, Admin');
