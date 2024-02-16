USE [RedBone]
GO

/****** Object:  Table [payroll].[PayrollItem]    Script Date: 2/16/2024 11:13:05 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollItem]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollItem]
GO

/****** Object:  Table [payroll].[PayrollItem]    Script Date: 2/16/2024 11:13:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollItem](
	[PayrollItemId] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PayrollItem] PRIMARY KEY CLUSTERED 
(
	[PayrollItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollItem] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--TEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMP
INSERT INTO [payroll].[PayrollItem] ([Name]) VALUES ('Payroll Item 1');
INSERT INTO [payroll].[PayrollItem] ([Name]) VALUES ('Payroll Item 2');
