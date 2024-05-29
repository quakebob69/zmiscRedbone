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



















IF dbo.IsInteger(@LSearchAllString) = 1
BEGIN
    
		INSERT INTO @ValidLoads
		SELECT LoadId FROM dispatch.Load where LoadId = @LSearchAllString
END
ELSE
BEGIN
    PRINT 'Poor score.';
END








		--INSERT INTO @ValidLoads
		--SELECT LoadId FROM dispatch.Load where LoadId = @LSearchAllString

		--INSERT INTO @ValidLoads
		--SELECT LoadId FROM dispatch.Load where TripNumber = @LSearchAllString
		
		--INSERT INTO @ValidLoads
		--SELECT LoadId FROM dispatch.Load where CustomerLoadNumber = @LSearchAllString
	END

	--SELECT top 1 LoadId FROM @ValidLoads

END

GO







exec dbo.sp_LoadsForBilling_Get '62406' --62406
exec dbo.sp_LoadsForBilling_Get '229292'--229292
exec dbo.sp_LoadsForBilling_Get '12869'--12869
exec dbo.sp_LoadsForBilling_Get '50225'--12869

