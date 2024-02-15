USE [RedBone]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonPhoneNumber_Insert]    Script Date: 1/30/2024 3:38:04 PM ******/
DROP PROCEDURE [dbo].[sp_PersonPhoneNumber_Insert]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonPhoneNumber_Insert]    Script Date: 1/30/2024 3:38:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PersonPhoneNumber_Insert]
(
	@PersonId int,
	@PhoneNumberTypeId smallint,
	@PhoneNumber varchar(50),
	@CellCarrierId smallint,
	@UseForDispatch bit,
	@UseForQuickApps bit,
	@ContactName varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO main.PersonPhoneNumber
                         (PersonId, PhoneNumberTypeId, PhoneNumber, CellCarrierId, UseForDispatch, UseForQuickApps, ContactName)
VALUES        (@PersonId,@PhoneNumberTypeId,@PhoneNumber,@CellCarrierId,@UseForDispatch,@UseForQuickApps,@ContactName)


	-- Change tracking for QuickBooks
	declare @TableChangedDt datetime
	set @TableChangedDt = GETDATE()
	declare @PersonPhoneNumberId int
	set @PersonPhoneNumberId = SCOPE_IDENTITY()
	
	exec sp_QuickBooksUpdateNeeded_Insert 'main', 'PersonPhoneNumber', @TableChangedDt, @PersonPhoneNumberId, 'I', ''

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


-- SELECT PersonPhoneNumberId, PersonId, PhoneNumberTypeId, PhoneNumber FROM main.PersonPhoneNumber WHERE (PersonPhoneNumberId = SCOPE_IDENTITY())
GO

