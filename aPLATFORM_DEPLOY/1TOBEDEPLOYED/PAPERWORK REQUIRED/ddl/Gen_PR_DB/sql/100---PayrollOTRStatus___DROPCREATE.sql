USE [RedBone]
GO

/****** Object:  Table [payroll].[PayrollOTRStatus]    Script Date: 2/14/2024 1:12:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStatus]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRStatus]
GO

/****** Object:  Table [payroll].[PayrollOTRStatus]    Script Date: 2/14/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRStatus](
	[PayrollOTRStatusId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[UseForPayroll] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollOTRStatus] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRStatusName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Description], [UseForPayroll]) VALUES (1, 'NOTSTARTED', 'OTR Payroll has not started for this PayPeriod.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Description], [UseForPayroll]) VALUES (2, 'STAGING', 'OTR payroll is being staged.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Description], [UseForPayroll]) VALUES (3, 'STAGED', 'OTR payroll has been staged and is ready to be entered into QuickBooks.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Description], [UseForPayroll]) VALUES (4, 'ENTERED', 'OTR payroll has been entered into QuickBooks and is ready to be Validated.', 1);;
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Description], [UseForPayroll]) VALUES (5, 'VALIDATED', 'OTR payroll has been Validated is ready to be Finalized.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Description], [UseForPayroll]) VALUES (6, 'FINALIZED', 'OTR payroll has been entered Finalized.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Description], [UseForPayroll]) VALUES (7, 'HISTORY', 'Use For Historical Purposes.', 0);
