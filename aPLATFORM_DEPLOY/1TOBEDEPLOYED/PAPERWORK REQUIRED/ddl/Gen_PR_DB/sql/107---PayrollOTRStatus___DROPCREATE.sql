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
	[UserStepsJson] [varchar](1024) NOT NULL
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
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson]) VALUES (1, 'NOTOPENED', 1, 'Ready to Open', '["OTR payroll has not started for this pay period.", "1. Click ''Open the Pay Period'' button."]');
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson]) VALUES (2, 'STAGING', 2, 'Staging', '["1. Get, or refresh, payroll data using the data buttons.","2. Click ''Lock Data''.","3. Generate ''QuickBooks Data Entry'' file by clicking the green ''qb'' button.", "4. If needed, click ''Unlock Data'', correct ''Driver Pay'' and/or ''Load'' data, and repeat steps 1 - 3.","5. Manually enter the data into QuickBooks.","6. Click ''Submit For Validation''."]');
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson]) VALUES (3, 'VALIDATING', 3, 'Validating', '["OTR payroll has been entered into QuickBooks and is ready to be validated.","1. Generate the ''QuickBooks Data Entry'' file by clicking on the green ''qb'' button.","2. Compare the contents of the file to what was entered into QuickBooks.","3. Pass or Fail the validation by clicking on the appropriate button."]');
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson]) VALUES (4, 'VALIDATION_FAILED', 4, 'Validation Failed', '["OTR payroll failed the validation step.", "1) Manually make the necessary corrections in QuickBooks.", "2) Click ''Submit For Validation''.","NOTE: click ''Unlock Data'' to correct ''Driver Pay'' and/or ''Load'' data".]');
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson]) VALUES (5, 'VALIDATION_PASSED', 5, 'Validation Passed', '["OTR payroll has been successfully validated is ready to be finalized. This pay period will be closed and the next one will be initialzed.", "1. Click ''Finalize the Pay Period''","NOTE: click ''Unlock Data'' to correct ''Driver Pay'' and/or ''Load'' data""]');
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [ShortDescription], [UserStepsJson]) VALUES (6, 'FINALIZED', 6, 'Finalized', '["OTR payroll has been finalized."]');
