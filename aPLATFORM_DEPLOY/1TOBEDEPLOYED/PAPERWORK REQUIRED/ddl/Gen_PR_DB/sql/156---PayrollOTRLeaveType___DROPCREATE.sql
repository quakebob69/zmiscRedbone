/****** Object:  Table [payroll].[PayrollOTRLeaveType]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRLeaveType]') AND type in (N'U'))
DROP TABLE [payroll].[PayrollOTRLeaveType]
GO

/****** Object:  Table [payroll].[PayrollOTRLeaveType]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRLeaveType](
	[PayrollOTRLeaveTypeId] [int] NOT NULL,
	[Type] [varchar](30) NOT NULL,
	[Description] [varchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollOTRLeaveType] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRLeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PayrollOTRLeaveType] UNIQUE NONCLUSTERED 
(
	[Type]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT INTO [payroll].[PayrollOTRLeaveType] ([PayrollOTRLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (1,'Placeholder' ,'Placeholder' ,1)
--INSERT INTO [payroll].[PayrollOTRLeaveType] ([PayrollOTRLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (2,'FedEx' ,'FedEx' ,1)
--INSERT INTO [payroll].[PayrollOTRLeaveType] ([PayrollOTRLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (3,'Salary' ,'Salary' ,1)
--INSERT INTO [payroll].[PayrollOTRLeaveType] ([PayrollOTRLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (4,'Hourly' ,'Hourly' ,1)
--INSERT INTO [payroll].[PayrollOTRLeaveType] ([PayrollOTRLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (5,'Unassigned' ,'Unassigned' ,1)
--INSERT INTO [payroll].[PayrollOTRLeaveType] ([PayrollOTRLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (6,'N/A' ,'N/A' ,1)
