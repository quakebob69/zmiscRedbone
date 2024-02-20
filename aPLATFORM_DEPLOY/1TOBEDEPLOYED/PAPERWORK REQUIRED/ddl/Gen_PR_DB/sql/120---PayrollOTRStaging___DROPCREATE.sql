--ALTER TABLE [payroll].[PayrollOTRStaging] DROP CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRPayPeriod]
--GO

/****** Object:  Table [payroll].[PayrollOTRStaging]    Script Date: 2/14/2024 1:09:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStaging]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRStaging]
GO

/****** Object:  Table [payroll].[PayrollOTRStaging]    Script Date: 2/14/2024 1:09:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRStaging](
	[PayrollOTRStagingId] [int] IDENTITY(1,1) NOT NULL,
	[PayrollOTRPayPeriodId] [int] NOT NULL,
	[isSourceLoad] [bit] NOT NULL,
	[isSourceDriverPay] [bit] NOT NULL,
	[Name] [varchar](max) NULL,
	[LoadId] [int] NULL,
	[TripNumber] [varchar](15) NULL,
	[TruckNumber] [int] NULL,
	[Client_Id] [varchar](max) NULL,
	[PickupBy] [datetime] NULL,
	[DeliverBy] [datetime] NULL,
	[DriverType] [varchar](max) NULL,
	[LegInd] [bit] NULL,
	[PickOrigin] [varchar](max) NULL,
	[DropDest] [varchar](max) NULL,
	[DriverPersonId] [int] NULL,
	[PayCode] [varchar](max) NULL,
	[PayId] [int] NULL,
	[Quantity] [decimal](10, 2) NULL,
	[PayRateAmount] [decimal](10, 2) NULL,
	[TotalPay] [decimal](10, 2) NULL,
	[PayPeriodEnding] [datetime] NULL,
	[PayrollNotes] [varchar](max) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUpdateBy] [int] NOT NULL,
	[PUnitId] [int] NULL,
 CONSTRAINT [PK_PayrollOTRStaging] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRStagingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [payroll].[PayrollOTRStaging]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRPayPeriod] FOREIGN KEY([PayrollOTRPayPeriodId])
REFERENCES [payroll].[PayrollOTRPayPeriod] ([PayrollOTRPayPeriodId])
GO

ALTER TABLE [payroll].[PayrollOTRStaging] CHECK CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRPayPeriod]
GO


