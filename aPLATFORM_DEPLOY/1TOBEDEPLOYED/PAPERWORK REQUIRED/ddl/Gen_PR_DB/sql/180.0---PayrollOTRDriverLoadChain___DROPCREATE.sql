/****** Object:  Table [payroll].[PayrollOTRDriverLoadChain]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRDriverLoadChain]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRDriverLoadChain]
GO

/****** Object:  Table [payroll].[PayrollOTRDriverLoadChain]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRDriverLoadChain](
	[PayrollOTRDriverLoadChainId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[LoadId] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[BeginTimeZone] [varchar](5) NULL,
	[BeginCity] [varchar](50) NOT NULL,
	[BeginState] [varchar](10) NOT NULL,
	[BeginAtHomeTerminal] [bit] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[EndTimeZone] [varchar](5) NULL,
	[EndCity] [varchar](50) NOT NULL,
	[EndState] [varchar](10) NOT NULL,
	[EndAtHomeTerminal] [bit] NOT NULL
 CONSTRAINT [PK_PayrollOTRDriverLoadChain] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRDriverLoadChainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRDriverLoadChain] UNIQUE NONCLUSTERED 
(
	[PersonId],
	[LoadId]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [payroll].[PayrollOTRDriverLoadChain]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRDriverLoadChain_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [payroll].[PayrollOTRDriverLoadChain] CHECK CONSTRAINT [FK_PayrollOTRDriverLoadChain_Person]
GO

ALTER TABLE [payroll].[PayrollOTRDriverLoadChain]   WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRDriverLoadChain_Load] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[Load] ([LoadId])
GO
ALTER TABLE [payroll].[PayrollOTRDriverLoadChain]  CHECK CONSTRAINT [FK_PayrollOTRDriverLoadChain_Load]
GO

