--ALTER TABLE [payroll].[PayrollOTRStaging] DROP CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRPayPeriod]
--GO

--ALTER TABLE [payroll].[PayrollOTRStaging] DROP CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRDataSource]
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
	[PayrollOTRDataSourceId] [int] NOT NULL,
	[IsHeld] [bit] NULL,
	[Name] [varchar](128) NULL,
	[LoadId] [int] NULL,
	[TripNumber] [varchar](15) NULL,
	[TruckNumber] [int] NULL,
	[Client_Id] [varchar](30) NULL,
	[PickupBy] [datetime] NULL,
	[DeliverBy] [datetime] NULL,
	[DriverType] [varchar](5) NULL,
	[LegInd] [bit] NULL,
	[PickOrigin] [varchar](128) NULL,
	[DropDest] [varchar](128) NULL,
	[DriverPersonId] [int] NULL,
	[PayCode] [varchar](128) NULL,
	[PayId] [int] NULL,
	[Quantity] [decimal](10, 2) NULL,
	[PayRateAmount] [decimal](10, 2) NULL,
	[TotalPay] [decimal](10, 2) NULL,
	[PayPeriodEnding] [datetime] NULL,
	[PayrollNotes] [varchar](128) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUpdateBy] [int] NOT NULL,
	[PUnitId] [int] NULL,
 CONSTRAINT [PK_PayrollOTRStaging] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRStagingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [payroll].[PayrollOTRStaging]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRPayPeriod] FOREIGN KEY([PayrollOTRPayPeriodId])
REFERENCES [payroll].[PayrollOTRPayPeriod] ([PayrollOTRPayPeriodId])
GO
ALTER TABLE [payroll].[PayrollOTRStaging] CHECK CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRPayPeriod]
GO


ALTER TABLE [payroll].[PayrollOTRStaging]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRDataSource] FOREIGN KEY([PayrollOTRDataSourceId])
REFERENCES [payroll].[PayrollOTRDataSource] ([PayrollOTRDataSourceId])
GO
ALTER TABLE [payroll].[PayrollOTRStaging] CHECK CONSTRAINT [FK_PayrollOTRStaging_PayrollOTRDataSource]
GO

