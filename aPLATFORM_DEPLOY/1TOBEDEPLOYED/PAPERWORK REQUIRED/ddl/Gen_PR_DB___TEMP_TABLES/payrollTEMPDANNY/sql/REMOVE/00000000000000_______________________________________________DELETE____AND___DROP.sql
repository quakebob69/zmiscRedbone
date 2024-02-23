USE [RedBoneThomas]
GO




--ALTER TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY] DROP CONSTRAINT [FK_PersonPTO___payrollTEMPDANNY_PersonPTOType]
--GO
--ALTER TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY] DROP CONSTRAINT [FK_PersonPTO___payrollTEMPDANNY_Person]
--GO




IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]') AND type in (N'U'))
	--DELETE FROM [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY];
	DROP TABLE [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY]
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY]') AND type in (N'U'))
	--DELETE FROM [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY];
	DROP TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY];
GO


--select count(*) from [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY];

--select count(*) from [payrollTEMPDANNY].[PR_OTR_History___payrollTEMPDANNY];


IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'payrollTEMPDANNY')
BEGIN
    EXEC('DROP SCHEMA payrollTEMPDANNY')
END
GO