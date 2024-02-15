USE [RedBone]
GO
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--PTO Reference Tables
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	--PersonPTOGroup
		--select * from 
		--	[main].[PersonPTOGroup]

	--PersonPTOType
		--select * from 
		--	[main].[PersonPTOType]
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



--select * from main.person where personid = 2183



--------------------------------------------------------
--PTO Transactional Tables
--------------------------------------------------------
DECLARE @PersonId INTEGER = 2183
	--PersonPTO
		select * from 
			[main].[PersonPTO]
		where
			PersonId = @PersonId
			order by createdon;

	--PersonPTOGroup
		select * from 
			[main].[PersonPTOGroup]
		where
			PersonPTOGroupId = 
			(select PersonPTOGroupId from 
				[main].[PersonPTOGroupMapping]
				where
			PersonId = @PersonId)

	--PersonPTOGroupMapping
		select * from 
			[main].[PersonPTOGroupMapping]
		where
			PersonId = @PersonId;

	--PersonPTOScheduled
		select * from 
			[main].[PersonPTOScheduled]
		where
			PersonId = @PersonId;
--------------------------------------------------------





--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	--PersonPTODailyRate
		--NOT USED?
			--1) no references found in database
			--2) found 1 reference in DriverDailyRate_Management.aspx but appears to be an orphaned page
				--SELECT 
				--	[PersonPTODailyRateId]
				-- ,[DriverRate]
				--  ,[DailyRate]
				--FROM [RedBone].[main].[PersonPTODailyRate]

