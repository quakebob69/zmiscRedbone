USE [RedBone]
GO

/****** Object:  Table [main].[PersonProfileFile]    Script Date: 12/12/2023 12:23:11 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[main].[PersonProfileFile]') AND type in (N'U'))
DROP TABLE [main].[PersonProfileFile]
GO

/****** Object:  Table [main].[PersonProfileFile]    Script Date: 12/12/2023 12:23:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [main].[PersonProfileFile](
	[PersonProfileFileId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Data] [varbinary](max) NULL,
	[MimeType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PersonProfileFile] PRIMARY KEY CLUSTERED 
(
	[PersonProfileFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

