/****** Object:  Table [payroll].[PayrollOTRDataSource]    Script Date: 2/16/2024 1:16:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRDataSource]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRDataSource]
GO

/****** Object:  Table [payroll].[PayrollOTRDataSource]    Script Date: 2/16/2024 1:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRDataSource](
	[PayrollOTRDataSourceId] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollOTRDataSource] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRDataSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRDataSource] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [payroll].[PayrollOTRDataSource] ([PayrollOTRDataSourceId], [Name], [Enabled]) VALUES (1, 'LOAD', 1);
INSERT INTO [payroll].[PayrollOTRDataSource] ([PayrollOTRDataSourceId], [Name], [Enabled]) VALUES (2, 'DRIVERPAY', 1);
