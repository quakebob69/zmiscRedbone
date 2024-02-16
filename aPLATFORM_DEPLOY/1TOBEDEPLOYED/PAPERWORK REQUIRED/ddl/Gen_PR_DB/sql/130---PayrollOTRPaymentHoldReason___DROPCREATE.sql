USE [RedBone]
GO

/****** Object:  Table [payroll].[PayrollOTRPaymentHoldReason]    Script Date: 2/16/2024 1:16:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPaymentHoldReason]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRPaymentHoldReason]
GO

/****** Object:  Table [payroll].[PayrollOTRPaymentHoldReason]    Script Date: 2/16/2024 1:16:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRPaymentHoldReason](
	[PayrollOTRPaymentHoldReasonId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](128) NOT NULL,
	[Resolution] [varchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollOTRPaymentHoldReason] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRPaymentHoldReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRPaymentHoldReason] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [payroll].[PayrollOTRPaymentHoldReason] ([PayrollOTRPaymentHoldReasonId], [Name], [Description], [Resolution], [Enabled]) VALUES (1, 'INCOMPLETELOADPAPER', 'The load is missing paperwork.', 'The payment will be sent after all paperwork is recieved for the Load.', 1);
INSERT INTO [payroll].[PayrollOTRPaymentHoldReason] ([PayrollOTRPaymentHoldReasonId], [Name], [Description], [Resolution], [Enabled]) VALUES (2, 'ZEROOTRMILES', 'The driver has zero OTR miles.', 'The payment will be sent after the driver has been paid for OTR miles.', 1);
