DROP PROCEDURE IF EXISTS [dbo].[sp_LoadsForBilling_Get]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadsForBilling_Get]    Script Date: 5/29/2024 9:40:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LoadsForBilling_Get] (@SearchAllString VARCHAR(max) = '')
AS
BEGIN
	IF 1 = 0
	BEGIN
		SET FMTONLY OFF
	END

	DECLARE @LSearchAllString VARCHAR(max) = @SearchAllString
	DECLARE @ValidLoads TABLE (LoadId INT NOT NULL PRIMARY KEY CLUSTERED);

	IF COALESCE(@LSearchAllString, '') <> ''
	BEGIN
		IF dbo.IsInteger(@LSearchAllString) = 1
		BEGIN
			INSERT INTO @ValidLoads
				SELECT LoadId
				FROM dispatch.LOAD
				WHERE LoadId = @LSearchAllString

			IF (SELECT count(*) FROM @ValidLoads) < 1
			BEGIN
				INSERT INTO @ValidLoads
					SELECT LoadId
					FROM dispatch.LOAD
					WHERE TripNumber = @LSearchAllString
			END

			IF (SELECT count(*) FROM @ValidLoads) < 1
			BEGIN
				INSERT INTO @ValidLoads
					SELECT LoadId
					FROM dispatch.LOAD
					WHERE CustomerLoadNumber = @LSearchAllString
			END
		END
		ELSE
		BEGIN
			INSERT INTO @ValidLoads
				SELECT LoadId
				FROM dispatch.LOAD
				WHERE CustomerLoadNumber = @LSearchAllString
		END
	END

	SELECT TOP 1 LoadId FROM @ValidLoads
END
GO

EXEC dbo.sp_LoadsForBilling_Get '62406' --62406
EXEC dbo.sp_LoadsForBilling_Get '229292' --229292
EXEC dbo.sp_LoadsForBilling_Get '12869' --12869
EXEC dbo.sp_LoadsForBilling_Get '50225' --12869
EXEC dbo.sp_LoadsForBilling_Get 'Q82380077' --62318