USE [RedBone]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--ALTER TABLE [RedBone].[main].[DriverPoint] DROP CONSTRAINT IF EXISTS DF_maindriverpoint_Cost
--ALTER TABLE [RedBone].[main].[DriverPoint] DROP COLUMN IF EXISTS [Cost];

ALTER TABLE [main].[DriverPoint]
ADD [Cost] [decimal](18, 2) NOT NULL CONSTRAINT DF_maindriverpoint_Cost DEFAULT 0.00
GO


