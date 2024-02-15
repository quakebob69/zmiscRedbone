USE [RedBone]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [main].[PersonProfileFile] 
	ALTER COLUMN [Data] [varbinary](max) NOT NULL;
GO

ALTER TABLE [main].[PersonProfileFile] 
	ALTER COLUMN [MimeType] [nvarchar](50) NULL;
GO
