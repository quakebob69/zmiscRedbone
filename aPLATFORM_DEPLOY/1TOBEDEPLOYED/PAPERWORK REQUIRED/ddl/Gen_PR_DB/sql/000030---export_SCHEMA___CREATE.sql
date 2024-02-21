USE [RedBoneThomas]
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'export')
BEGIN
    EXEC('CREATE SCHEMA export')
END