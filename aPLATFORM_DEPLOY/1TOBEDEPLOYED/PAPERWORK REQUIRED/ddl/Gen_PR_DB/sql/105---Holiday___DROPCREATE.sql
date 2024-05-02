/****** Object:  Table [payroll].[Holiday]    Script Date: 2/14/2024 1:12:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[Holiday]') AND type in (N'U'))
DROP TABLE [payroll].[Holiday]
GO

/****** Object:  Table [payroll].[Holiday]    Script Date: 2/14/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[Holiday](
	[HolidayId] [int] NOT NULL,
	[FYId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Name] [varchar](30) NOT NULL
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[HolidayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Holiday] UNIQUE NONCLUSTERED 
(
	[FYId] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [payroll].[Holiday]  WITH CHECK ADD  CONSTRAINT [FK_Holiday_FYId] FOREIGN KEY([FYId])
REFERENCES [main].[FY] ([FYId])
GO
ALTER TABLE [payroll].[Holiday] CHECK CONSTRAINT [FK_Holiday_FYId]
GO


-----------------------------------------
INSERT INTO [payroll].[Holiday] ([HolidayId], [FYId], [Date], [Name]) VALUES (1, 1, '2023-12-13 00:00:00.000', 'National Danny Day');
