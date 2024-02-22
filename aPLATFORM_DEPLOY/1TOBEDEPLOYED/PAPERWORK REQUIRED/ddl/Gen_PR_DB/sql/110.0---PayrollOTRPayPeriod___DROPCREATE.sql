--ALTER TABLE [payroll].[PayrollOTRPayPeriod] DROP CONSTRAINT [FK_PayrollOTRPayPeriod_PayrollOTRStatus]
--GO

/****** Object:  Table [payroll].[PayrollOTRPayPeriod]    Script Date: 2/14/2024 1:12:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPayPeriod]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRPayPeriod]
GO

/****** Object:  Table [payroll].[PayrollOTRPayPeriod]    Script Date: 2/14/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRPayPeriod](
	[PayrollOTRPayPeriodId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](4) NOT NULL,
	[FY] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[PayrollOTRStatusId] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[LoadDataIsStaged] [bit] NOT NULL,
	[DriverPayDataIsStaged] [bit] NOT NULL,
	[TotalMiles] [int] NULL,
	[TotalMilesValue] [decimal](18, 2) NULL,
	[TotalHeldAmount] [decimal](18, 2) NULL,
	[PTOTotalHrsAccrual] [int] NULL,
	[UTOTotalDaysAccrual] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[LastUpdateBy] [int] NULL
 CONSTRAINT [PK_PayrollOTRPayPeriod] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRPayPeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRPayPeriod__Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRPayPeriod__FY_Number] UNIQUE NONCLUSTERED 
(
	[FY] ASC,
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [payroll].[PayrollOTRPayPeriod]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRPayPeriod_PayrollOTRStatus] FOREIGN KEY([PayrollOTRStatusId])
REFERENCES [payroll].[PayrollOTRStatus] ([PayrollOTRStatusId])
GO
ALTER TABLE [payroll].[PayrollOTRPayPeriod] CHECK CONSTRAINT [FK_PayrollOTRPayPeriod_PayrollOTRStatus]
GO


