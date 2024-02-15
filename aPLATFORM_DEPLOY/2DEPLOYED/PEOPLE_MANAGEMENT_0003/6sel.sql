USE [RedBone]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonPhoneNumber_Select]    Script Date: 1/30/2024 3:39:39 PM ******/
DROP PROCEDURE [dbo].[sp_PersonPhoneNumber_Select]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonPhoneNumber_Select]    Script Date: 1/30/2024 3:39:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PersonPhoneNumber_Select]
@PersonId int
AS
	SET NOCOUNT ON;
SELECT        PersonPhoneNumberId, PersonId, PhoneNumberTypeId, PhoneNumber, CellCarrierId, UseForDispatch, UseForQuickApps, ContactName
FROM            main.PersonPhoneNumber
WHERE        (PersonId = @PersonId)
GO

