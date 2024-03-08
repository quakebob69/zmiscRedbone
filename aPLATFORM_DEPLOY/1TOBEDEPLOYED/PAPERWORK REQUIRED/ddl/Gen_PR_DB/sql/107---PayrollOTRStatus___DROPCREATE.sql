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
	[UserStepsJson] [varchar](256) NOT NULL,
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
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson], [UseForPayrollProcess]) VALUES (1, 'NOTOPENED', 1, 'Ready to Open', '["OTR payroll has not started for this pay period.", "Click ''Open the Pay Period'' button."]', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson], [UseForPayrollProcess]) VALUES (2, 'STAGING', 2, 'Staging', '["1) Get (or refresh) payroll data.", "2) Generate the QuickBooks data entry file by clicking on the green ''qb'' button.", "3)  If needed, correct ''Driver Pay'' data and/or ''Load'' data and repeat steps 1 and 2."]', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson], [UseForPayrollProcess]) VALUES (3, 'STAGED', 3, 'Staged', '["OTR payroll has been staged and is ready to be entered into QuickBooks."]', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson], [UseForPayrollProcess]) VALUES (4, 'ENTERED', 4, 'Entered', '["OTR payroll has been entered into QuickBooks and is ready to be validated."]', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson], [UseForPayrollProcess]) VALUES (5, 'VALIDATED', 5, 'Validated', '["OTR payroll has been successfully validated is ready to be finalized.", "Click ''Finalize the Pay Period''", "This pay period will be closed and the next one will be initialzed."]', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson], [UseForPayrollProcess]) VALUES (6, 'FINALIZED', 6, 'Finalized', '["OTR payroll has been finalized."]', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson], [UseForPayrollProcess]) VALUES (7, 'HISTORY', NULL, 'History', '["Used for historical purposes."]', 0);
