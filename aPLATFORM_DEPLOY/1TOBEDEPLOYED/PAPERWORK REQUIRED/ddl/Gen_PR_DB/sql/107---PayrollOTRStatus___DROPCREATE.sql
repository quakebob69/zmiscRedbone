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
	[Description] [varchar](128) NOT NULL,
	[HasUserAction] [int] NOT NULL,
	[UserAction] [varchar](128) NULL,
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
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [Description], [HasUserAction], [UserAction], [UseForPayrollProcess]) VALUES (1, 'NOTSTARTED', 1, 'OTR payroll has not started for this pay period.', 1, 'Initialize (or re-Initialize) the pay period.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [Description], [HasUserAction], [UserAction], [UseForPayrollProcess]) VALUES (2, 'STAGING', 2, 'OTR payroll data is being corrected and staged.', 1, 'Correct any bad or missing data (in ''Trucking Loads'' and ''Driver Pay'') and re-stage it.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [Description], [HasUserAction], [UserAction], [UseForPayrollProcess]) VALUES (3, 'STAGED', 3, 'OTR payroll has been staged and is ready to be entered into QuickBooks.', 1, 'Print ''QuickBook Data Entry - OTR Payroll'' PDF document and enter its data into QuickBooks.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [Description], [HasUserAction], [UserAction], [UseForPayrollProcess]) VALUES (4, 'ENTERED', 4, 'OTR payroll has been entered into QuickBooks and is ready to be validated.', 1, 'Validate that the data entered into QuickBooks matches the data in the PDF file.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [Description], [HasUserAction], [UserAction], [UseForPayrollProcess]) VALUES (5, 'VALIDATED', 5, 'OTR payroll has been validated is ready to be vinalized.', 1, 'Finalize the pay period.', 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [Description], [HasUserAction], [UserAction], [UseForPayrollProcess]) VALUES (6, 'FINALIZED', 6, 'OTR payroll has been finalized.', 0, NULL, 1);
INSERT INTO [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId], [Name], [Order], [Description], [HasUserAction], [UserAction], [UseForPayrollProcess]) VALUES (7, 'HISTORY', NULL, 'Used for historical purposes.', 0, NULL, 0);
