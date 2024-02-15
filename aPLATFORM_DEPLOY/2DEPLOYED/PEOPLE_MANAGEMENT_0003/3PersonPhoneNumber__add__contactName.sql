USE [RedBone]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [main].[PersonPhoneNumber]
ADD [ContactName] [varchar](50) NULL
GO