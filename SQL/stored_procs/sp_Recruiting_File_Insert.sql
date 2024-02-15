--CREATE PROCEDURE [dbo].sp_Recruiting_File_Insert
(
	@Name nvarchar(50),
	@Data varbinary(MAX),
	@MimeType nvarchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [recruiting].[ProfileFile] ([Name], [Data], [MimeType]) VALUES (@Name, @Data, @MimeType);
	
SELECT ProfileFileId, Name, Data, MimeType FROM recruiting.ProfileFile WHERE (ProfileFileId = SCOPE_IDENTITY())