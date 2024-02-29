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
	[Name] [varchar](30) NOT NULL,
	[Order] [int] NULL,
	[ShortDescription] [varchar](30) NOT NULL,
	[Description] [varchar](128) NOT NULL,
	[UserStepsJson] [varchar](512) NULL,
	[UseForPayrollProcess] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollOTRStatus] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRStatus] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [Description], [UserStepsJson], [UseForPayrollProcess]) VALUES (1, 'NOTSTARTED', 1, 'Not Started', 'OTR payroll has not started for this pay period.', NULL, 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [Description], [UserStepsJson], [UseForPayrollProcess]) VALUES (2, 'STAGING', 2, 'Staging', 'OTR payroll data is being corrected and staged.', NULL, 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [Description], [UserStepsJson], [UseForPayrollProcess]) VALUES (3, 'STAGED', 3, 'Staged', 'OTR payroll has been staged and is ready to be entered into QuickBooks.', NULL, 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [Description], [UserStepsJson], [UseForPayrollProcess]) VALUES (4, 'ENTERED', 4, 'Entered', 'OTR payroll has been entered into QuickBooks and is ready to be validated.', NULL, 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [Description], [UserStepsJson], [UseForPayrollProcess]) VALUES (5, 'VALIDATED', 5, 'Validated', 'OTR payroll has been validated is ready to be vinalized.', NULL, 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [Description], [UserStepsJson], [UseForPayrollProcess]) VALUES (6, 'FINALIZED', 6, 'Finalized', 'OTR payroll has been finalized.', NULL, 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [Description], [UserStepsJson], [UseForPayrollProcess]) VALUES (7, 'HISTORY', NULL, 'History', 'Used for historical purposes.', NULL, 0);
