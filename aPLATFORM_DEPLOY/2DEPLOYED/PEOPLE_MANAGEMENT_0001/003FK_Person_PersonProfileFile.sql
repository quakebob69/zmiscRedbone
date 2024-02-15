USE [RedBone]
GO

ALTER TABLE [main].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PersonProfileFile] FOREIGN KEY([PersonProfileFileId])
REFERENCES [main].[PersonProfileFile] ([PersonProfileFileId])
GO

ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_PersonProfileFile]
GO
