/****** Object:  Table [payroll].[PayrollOTRPersonLeaveType]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPersonLeaveType]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRPersonLeaveType]
GO

/****** Object:  Table [payroll].[PayrollOTRPersonLeaveType]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRPersonLeaveType](
	[PayrollOTRPersonLeaveTypeId] [int] NOT NULL,
	[Type] [varchar](30) NOT NULL,
	[Description] [varchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollOTRPersonLeaveType] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRPersonLeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRPersonLeaveType] UNIQUE NONCLUSTERED 
(
	[Type]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
