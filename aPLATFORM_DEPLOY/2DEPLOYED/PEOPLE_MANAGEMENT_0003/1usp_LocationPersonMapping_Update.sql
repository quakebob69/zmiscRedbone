USE [RedBone]
GO

/****** Object:  StoredProcedure [dbo].[usp_LocationPersonMapping_Update]    Script Date: 1/30/2024 11:14:03 AM ******/
DROP PROCEDURE [dbo].[usp_LocationPersonMapping_Update]
GO

/****** Object:  StoredProcedure [dbo].[usp_LocationPersonMapping_Update]    Script Date: 1/30/2024 11:14:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Todd C Byers
-- Create date: 05/09/18
-- Description:	Will add or remove LocationTypes from a person's LocationPersonMapping
-- =============================================
CREATE PROCEDURE [dbo].[usp_LocationPersonMapping_Update]
(
	@PersonId int,
	@LocationTypeId smallint,
	@Assigned bit
)
AS
	SET NOCOUNT OFF;
/*
  usp_LocationPersonMapping_Update 5
*/
begin
	DELETE 
	FROM main.LocationPersonMapping
	WHERE PersonId = @PersonId

	if not exists (SELECT 1 
	           FROM main.LocationPersonMapping
			   WHERE LocationTypeId = @LocationTypeId and PersonId = @PersonId)
	begin
		INSERT INTO main.LocationPersonMapping(LocationTypeId, PersonId) values (@LocationTypeId, @PersonId)
	end
end
GO

