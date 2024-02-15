USE [RedBone]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonPhoneNumber_Delete]    Script Date: 1/30/2024 3:38:44 PM ******/
DROP PROCEDURE [dbo].[sp_PersonPhoneNumber_Delete]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonPhoneNumber_Delete]    Script Date: 1/30/2024 3:38:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PersonPhoneNumber_Delete]
(
	@Original_PersonPhoneNumberId smallint
)
AS
	SET NOCOUNT OFF;
DELETE FROM [main].[PersonPhoneNumber] WHERE (([PersonPhoneNumberId] = @Original_PersonPhoneNumberId))
GO

