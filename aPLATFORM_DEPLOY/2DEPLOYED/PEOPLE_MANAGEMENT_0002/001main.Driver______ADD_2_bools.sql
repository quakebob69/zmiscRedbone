USE [RedBone]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER TABLE [main].[Driver] 
	ADD PaidPetDeposit [bit] NULL;
GO


ALTER TABLE [main].[Driver] 
	ADD HasPassengerInsurance [bit] NULL;
GO


UPDATE [main].[Driver] set PaidPetDeposit = 0;
UPDATE [main].[Driver] set HasPassengerInsurance = 0;



