USE [RedBone]
GO

/****** Object:  Table [main].[PhoneNumberType]    Script Date: 2/16/2024 7:15:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRPaymentHoldReason](
	[PayrollOTRPaymentHoldReasonId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](128) NOT NULL,
	[Resolution] [varchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL
 CONSTRAINT [PK_PhoneNumberType] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRPaymentHoldReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------


- "IncompleteLoadPaper"/"The load is missing paperwork."/"The payment will be sent after all paperwork is recieved for the Load."
   - "ZeroOTRMiles"/"The driver has zero OTR miles."/"The Payment will be sent after the driver has been paid for OTR miles."







