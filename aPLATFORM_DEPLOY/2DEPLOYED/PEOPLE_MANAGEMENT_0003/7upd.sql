USE [RedBone]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonPhoneNumber_Update]    Script Date: 1/30/2024 3:40:00 PM ******/
DROP PROCEDURE [dbo].[sp_PersonPhoneNumber_Update]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonPhoneNumber_Update]    Script Date: 1/30/2024 3:40:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PersonPhoneNumber_Update]
(
	@PersonId int,
	@PhoneNumberTypeId smallint,
	@PhoneNumber varchar(50),
	@Original_PersonPhoneNumberId smallint,
	@PersonPhoneNumberId smallint,
	@CellCarrierId smallint,
	@UseForDispatch bit,
	@UseForQuickApps bit,
	@ContactName varchar(50)
)
AS
/*
exec sp_PersonPhoneNumber_Update 5, 3, '8012314991', 19, 19, 7, 1
*/
	SET NOCOUNT OFF;
UPDATE       main.PersonPhoneNumber
SET                PersonId = @PersonId, PhoneNumberTypeId = @PhoneNumberTypeId, PhoneNumber = @PhoneNumber, CellCarrierId = @CellCarrierId, UseForDispatch = @UseForDispatch, UseForQuickApps = @UseForQuickApps, ContactName = @ContactName
WHERE        (PersonPhoneNumberId = @Original_PersonPhoneNumberId)
	
	-- Change tracking for QuickBooks. 
	-- todo: est
	declare @TableChangedDt datetime
	set @TableChangedDt = GETDATE()

	exec sp_QuickBooksUpdateNeeded_Insert 'main', 'PersonPhoneNumber', @TableChangedDt, @PersonPhoneNumberId, 'U', ''

	-- if UseForDispatch is true, update all other Phone numbers for this Person as UseForDispatch=false
	if @UseForDispatch = 1
	begin
		update main.PersonPhoneNumber
		set UseForDispatch = 0
		where UseForDispatch = 1 and PersonId = @PersonId and PersonPhoneNumberId <> @PersonPhoneNumberId
	end

	-- if UseForQuickApps is true, update all other phone numbers for this Person as UseForQuickApps=false
	if @UseForQuickApps = 1
	begin
		update main.PersonPhoneNumber
		set UseForQuickApps = 0
		where UseForQuickApps = 1 and PersonId = @PersonId and PersonPhoneNumberId <> @PersonPhoneNumberId
	end

--SELECT PersonPhoneNumberId, PersonId, PhoneNumberTypeId, PhoneNumber FROM main.PersonPhoneNumber WHERE (PersonPhoneNumberId = @PersonPhoneNumberId)
GO

