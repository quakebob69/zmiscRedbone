USE [RedBoneThomas]
GO


IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'payroll')
BEGIN
    EXEC('CREATE SCHEMA payroll')
END
GO
