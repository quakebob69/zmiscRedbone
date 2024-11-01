/****** Object:  Table [main].[FY]    Script Date: 2/14/2024 1:12:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[main].[FY]') AND type in (N'U'))
DROP TABLE [main].[FY]
GO

/****** Object:  Table [main].[FY]    Script Date: 2/14/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [main].[FY](
	[FYId] [int] NOT NULL,
	[FY] [varchar](4) NOT NULL
 CONSTRAINT [PK_FY] PRIMARY KEY CLUSTERED 
(
	[FYId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_FY] UNIQUE NONCLUSTERED 
(
	[FY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-----------------------------------------
INSERT INTO [main].[FY] ([FYId], [FY]) VALUES (1, '2023');
INSERT INTO [main].[FY] ([FYId], [FY]) VALUES (2, '2024');
INSERT INTO [main].[FY] ([FYId], [FY]) VALUES (3, '2025');
INSERT INTO [main].[FY] ([FYId], [FY]) VALUES (4, '2026');
INSERT INTO [main].[FY] ([FYId], [FY]) VALUES (5, '2027');
INSERT INTO [main].[FY] ([FYId], [FY]) VALUES (6, '2028');
INSERT INTO [main].[FY] ([FYId], [FY]) VALUES (7, '2029');
INSERT INTO [main].[FY] ([FYId], [FY]) VALUES (8, '2030');
