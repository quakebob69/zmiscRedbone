 /****** Object:  Table [payroll].[PayrollOTRLeave]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRLeave]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRLeave]
GO

/****** Object:  Table [payroll].[PayrollOTRLeave]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRLeave](
	[PayrollOTRLeaveId] [int] IDENTITY(1,1) NOT NULL,
	[PayrollOTRLeaveTypeId] [int] NOT NULL,
	[PayPeriodId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Accrual] [bit] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[Hours] [decimal](10, 2) NULL,
	[Days] [int] NULL,
	[PaidValue] [decimal](18, 2) NULL,
	[Planned] [bit] NOT NULL,
	[Notes] [text] NULL,
	[LastUpdate] [datetime] NULL,
	[LastUpdatePersonId] [int] NULL
 CONSTRAINT [PK_PayrollOTRLeave] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRLeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRLeave] UNIQUE NONCLUSTERED 
(
	[PayrollOTRLeaveTypeId],
	[PayPeriodId],
	[PersonId],
	[Date],
	[Accrual],
	[IsPaid]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [payroll].[PayrollOTRLeave]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRLeave_PayrollOTRLeaveType] FOREIGN KEY([PayrollOTRLeaveTypeId])
REFERENCES [payroll].[PayrollOTRLeaveType] ([PayrollOTRLeaveTypeId])
GO
ALTER TABLE [payroll].[PayrollOTRLeave] CHECK CONSTRAINT [FK_PayrollOTRLeave_PayrollOTRLeaveType]
GO


ALTER TABLE [payroll].[PayrollOTRLeave]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRLeave_PayPeriodIdPayPeriod] FOREIGN KEY([PayPeriodId])
REFERENCES [payroll].[PayrollOTRPayPeriod] ([PayrollOTRPayPeriodId])
GO
ALTER TABLE [payroll].[PayrollOTRLeave] CHECK CONSTRAINT [FK_PayrollOTRLeave_PayPeriodIdPayPeriod]
GO


ALTER TABLE [payroll].[PayrollOTRLeave]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRLeave_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [payroll].[PayrollOTRLeave] CHECK CONSTRAINT [FK_PayrollOTRLeave_Person]
GO

