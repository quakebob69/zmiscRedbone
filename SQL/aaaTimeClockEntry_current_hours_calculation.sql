DECLARE @emailName NVARCHAR(25) = 'danny';





--ADJUST RECORDS
		-------------------------------------------------------------------------------------------------------------------------------------------------
		SELECT top 5 * FROM [RedBone].[main].[TimeClockEntry] WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com') order by EntryId desc
		-------------------------------------------------------------------------------------------------------------------------------------------------

																					--------------------------------------------------------------------------------------------------------------
																						--IN
																							--DECLARE @EntryId__IN INTEGER = 30845
																							--DECLARE @Clocked__IN NVARCHAR(25)		= '2024-10-07 07:47:39.883';
																							--UPDATE [RedBone].[main].[TimeClockEntry] SET ClockIn = @Clocked__IN WHERE EntryId = @EntryId__IN;

																								--UPDATE [RedBone].[main].[TimeClockEntry] SET ClockOutAdj = NULL
																							
																							--2024-09-06 15:30:00.000

																						--OUT
																							--DECLARE @EntryId__OUT INTEGER = 29988
																							--DECLARE @Clocked__OUT NVARCHAR(25)		= '2024-09-11 15:14:03.027'
																							--UPDATE [RedBone].[main].[TimeClockEntry] SET ClockOut = @Clocked__OUT WHERE EntryId = @EntryId__OUT;
																					--------------------------------------------------------------------------------------------------------------


																									--++++
																											--OTHER
																												--DECLARE @EntryId__IN INTEGER = 29108
																												--UPDATE [RedBone].[main].[TimeClockEntry] SET LastModifiedBy = 2775 WHERE EntryId = @EntryId__IN;
																									--++++

		-------------------------------------------------------------------------------------------------------------------------------------------------
		SELECT top 5 * FROM [RedBone].[main].[TimeClockEntry] WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com') order by EntryId desc
		-------------------------------------------------------------------------------------------------------------------------------------------------
		--XXX
			--2024-06-13 16:28:45.770



		--delete FROM [RedBone].[main].[TimeClockEntry] WHERE entryid = 29925




--QUITIN' TIME
		--**************************************************************************************************************************************************************************
		DECLARE @hourCurrent DECIMAL(38, 10)
		DECLARE @hourToReach DECIMAL(38, 10)



			--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$											----------
				SET @hourCurrent =														42.71
				SET @hourToReach =														45
			--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$											----------





		--**************************************************************************************************************************************************************************
			SELECT TOP 1
						FORMAT(DATEADD(MINUTE, (60 * (@hourToReach - @hourCurrent)), DATEADD(HOUR, -12, [ClockIn])), 'H:mm') as 'Leave'
			FROM
				[RedBone].[main].[TimeClockEntry]
			WHERE
				personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com')
			ORDER BY
				EntryId desc
		--**************************************************************************************************************************************************************************

























------------------------------------------
DECLARE @Yr VARCHAR(4)		= '2024'
	DECLARE @Mo VARCHAR(2)		= '06'
		DECLARE @Dy VARCHAR(2)		= '21'

	------------------------------------------
	DECLARE @Hr VARCHAR(2)		= '15'
		DECLARE @Mi VARCHAR(2)		= '10'




	
--1st RECORD
																																										/*
																																										SELECT TOP 1
																																												ROUND(CAST(DATEDIFF(minute, [ClockIn], [ClockOut]) as float)/CAST(60 as float), 2) as 'Before Lunch'
																																													--ROUND(CAST(DATEDIFF(minute, [ClockInAdj], [ClockOut]) as float)/CAST(60 as float), 2) as hours
																																														--ROUND(CAST(DATEDIFF(minute, [ClockIn], [ClockOutAdj]) as float)/CAST(60 as float), 2) as hours
																																															--ROUND(CAST(DATEDIFF(minute, [ClockInAdj], [ClockOutAdj]) as float)/CAST(60 as float), 2) as hours
																																											--,'----------------------------' as ' '
																																											--, *
																																										FROM
																																											[RedBone].[main].[TimeClockEntry]
																																										WHERE
																																											personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com')
																																												AND
																																											[ClockIn] >= CAST(GETDATE() AS DATE)
																																												AND
																																											[ClockIn] < DATEADD(DAY, 1, CAST(GETDATE() AS DATE))
																																										ORDER BY
																																											EntryId asc
																																										*/


--2nd RECORD
																																										/*
																																										SELECT TOP 1
																																												ROUND(CAST(DATEDIFF(minute, [ClockIn], GETDATE()) as float)/CAST(60 as float), 2) as 'Current Hours After Lunch'
																																														--ROUND(CAST(DATEDIFF(minute, [ClockInAdj], GETDATE()) as float)/CAST(60 as float), 2) as hours
																																												--,'----------------------------' as ' '
																																												--, *
																																											FROM
																																												[RedBone].[main].[TimeClockEntry]
																																											WHERE
																																												personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com')
																																													AND
																																												[ClockIn] >= CAST(GETDATE() AS DATE)
																																													AND
																																												[ClockIn] < DATEADD(DAY, 1, CAST(GETDATE() AS DATE))
																																											ORDER BY
																																												EntryId desc
																																										*/

------------------------------------------
DECLARE @YrMoDy datetime	= @Yr + '-' + @Mo + '-' + @Dy + ' ' + @Hr + ':' + @Mi
DECLARE @TimeToGo VARCHAR(5)	= CAST(CAST(@Hr as int) - 12 as VARCHAR) + ':' + @Mi
------------------------------------------
--3rd RECORD
																																										/*
																																											SELECT TOP 1
																																														--TARGET TIME
																																														ROUND(CAST(DATEDIFF(minute, [ClockIn], @YrMoDy) as float)/CAST(60 as float), 2) as 'Needed After Lunch', @TimeToGo as 'Quiting Time'
		

																																												--ROUND(CAST(DATEDIFF(minute, [ClockIn], GETDATE()) as float)/CAST(60 as float), 2) as hours
																																														--ROUND(CAST(DATEDIFF(minute, [ClockInAdj], GETDATE()) as float)/CAST(60 as float), 2) as hours
																																												--,'----------------------------' as ' '
																																												--, *
																																											FROM
																																												[RedBone].[main].[TimeClockEntry]
																																											WHERE
																																												personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com')
																																													AND
																																												[ClockIn] >= CAST(GETDATE() AS DATE)
																																													AND
																																												[ClockIn] < DATEADD(DAY, 1, CAST(GETDATE() AS DATE))
																																											ORDER BY
																																												EntryId desc
																																										*/



------------------------------------------------------------------------------------------------------------------SELECT * FROM [RedBone].[main].[TimeClockEntry] WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com') AND [ClockIn] >= CAST(GETDATE() AS DATE) AND [ClockIn] < DATEADD(DAY, 1, CAST(GETDATE() AS DATE)) order by EntryId desc


--SELECT * FROM [RedBone].[main].[TimeClockEntry] where personid = 2775 order by entryid desc

--SELECT * FROM [RedBone].[main].[TimeClockEntry] WHERE EntryId = @EntryId
	
--SELECT * FROM [RedBone].[main].[TimeClockEntry] WHERE EntryId = @EntryId

--UPDATE [RedBone].[main].[TimeClockEntry] SET ClockInAdj = null WHERE EntryId = @EntryId
