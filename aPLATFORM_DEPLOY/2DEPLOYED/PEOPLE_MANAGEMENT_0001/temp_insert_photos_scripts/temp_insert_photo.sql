USE [RedBone_PeopleMan]
GO
DECLARE @ImageData varbinary(max);







--SELECT * FROM [recruiting].[ProfileFile]
SELECT @ImageData = Data FROM [recruiting].[ProfileFile] WHERE ProfileFileId = 1004;




--DELETE FROM [main].PersonProfileFile 
---------------INSERT INTO [main].PersonProfileFile (Data) VALUES (@ImageData);
--



--SELECT * FROM [main].PersonProfileFile
---------------UPDATE [main].Person SET PersonProfileFileId = 3
--SELECT * FROM [main].PersonProfileFile





--UPDATE [main].PersonProfileFile SET PersonProfileFileId = 2
