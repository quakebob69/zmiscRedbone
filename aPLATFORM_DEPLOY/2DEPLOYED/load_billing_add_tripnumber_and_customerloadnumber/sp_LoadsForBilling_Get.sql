DROP PROCEDURE IF EXISTS [dbo].[sp_LoadsForBilling_Get]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadsForStatus_Get]    Script Date: 5/29/2024 9:40:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_LoadsForBilling_Get]
(
	@SearchAllString varchar(max) = ''
)
AS 
BEGIN

	IF 1=0 BEGIN
		SET FMTONLY OFF
	END

	DECLARE @LSearchAllString varchar(max) = @SearchAllString

	DECLARE @ValidLoads Table (LoadId int NOT NULL PRIMARY KEY CLUSTERED);

	IF COALESCE(@LSearchAllString, '') <> ''
	BEGIN
		INSERT INTO @ValidLoads
		SELECT LoadId FROM dispatch.Load where LoadId = @LSearchAllString
	END

	SELECT * FROM @ValidLoads

END

GO


