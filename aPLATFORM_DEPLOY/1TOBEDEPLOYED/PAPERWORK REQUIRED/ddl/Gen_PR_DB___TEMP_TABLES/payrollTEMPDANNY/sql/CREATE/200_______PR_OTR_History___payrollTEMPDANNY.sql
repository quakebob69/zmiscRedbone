USE [RedBoneThomas]
GO

/****** Object:  Table [payrollTEMPDANNY].[[PR_OTR_History___payrollTEMPDANNY]]    Script Date: 2/21/2024 12:15:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]') AND type in (N'U'))
DROP TABLE [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]
GO

/****** Object:  Table [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]    Script Date: 2/21/2024 12:15:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_PR_OTR_History___payrollTEMPDANNY] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


