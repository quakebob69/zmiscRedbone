USE [RedBoneThomas]
GO



--ALTER TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject] DROP CONSTRAINT [FK_PersonPTO___zzztempdannydeletethisafterproject_PersonPTOType]
--GO
--ALTER TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject] DROP CONSTRAINT [FK_PersonPTO___zzztempdannydeletethisafterproject_Person]
--GO




IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[zzztempdannydeletethisafterproject].[PR_OTR_History___zzztempdannydeletethisafterproject]') AND type in (N'U'))
	DELETE FROM [zzztempdannydeletethisafterproject].[PR_OTR_History___zzztempdannydeletethisafterproject];
	DROP TABLE [zzztempdannydeletethisafterproject].[PR_OTR_History___zzztempdannydeletethisafterproject]
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject]') AND type in (N'U'))
	DELETE FROM [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject];
	DROP TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject];
GO





IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'zzztempdannydeletethisafterproject')
BEGIN
    EXEC('DROP SCHEMA zzztempdannydeletethisafterproject')
END
GO