DROP TABLE IF EXISTS [payroll].[PayrollOTRBenefitsStatus]

/****** Object:  Table [payroll].[PayrollOTRBenefitsStatus]    Script Date: 5/10/2024 7:11:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRBenefitsStatus](
	[PayrollOTRBenefitsStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_PayrollOTRBenefitsStatus] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRBenefitsStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRBenefitsStatus] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([Name] ,[Description] ,[DisplayOrder]) VALUES ('New Employee Waiting Period', 'New Employee Waiting Period' , 1)
INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([Name] ,[Description] ,[DisplayOrder]) VALUES ('Full-Time', 'Full-Time' , 2)
INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([Name] ,[Description] ,[DisplayOrder]) VALUES ('Part-Time', 'Part-Time' , 3)
GO

