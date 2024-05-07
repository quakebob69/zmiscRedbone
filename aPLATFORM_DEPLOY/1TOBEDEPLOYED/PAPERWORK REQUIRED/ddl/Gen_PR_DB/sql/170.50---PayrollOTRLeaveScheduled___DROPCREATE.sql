/****** Object:  Table [payroll].[PayrollOTRLeaveScheduled]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRLeaveScheduled]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRLeaveScheduled]
GO

/****** Object:  Table [payroll].[PayrollOTRLeaveScheduled]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRLeaveScheduled](
	[PayrollOTRLeaveScheduledId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Hours] [decimal](10, 2) NOT NULL,
	[Days] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_PayrollOTRLeaveScheduled] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRLeaveScheduledId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRLeaveScheduled] UNIQUE NONCLUSTERED 
(
	[PersonId],
	[Date]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [payroll].[PayrollOTRLeaveScheduled]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRLeaveScheduled_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [payroll].[PayrollOTRLeaveScheduled] CHECK CONSTRAINT [FK_PayrollOTRLeaveScheduled_Person]
GO