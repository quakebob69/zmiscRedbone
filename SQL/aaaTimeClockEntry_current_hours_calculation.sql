-- caculate lunch time from first 2 records
--create column that says how many more minutes
-- ADD LUNCH to estimate????

------------------------------------------
DECLARE @emailName NVARCHAR(25) = 'danny';

	------------------------------------------
	DECLARE @Yr VARCHAR(4)		= '2024'
		DECLARE @Mo VARCHAR(2)		= '06'
			DECLARE @Dy VARCHAR(2)		= '14'

		------------------------------------------
		DECLARE @Hr VARCHAR(2)		= '16'
			DECLARE @Mi VARCHAR(2)		= '33'


--1st RECORD
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


--2nd RECORD
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

------------------------------------------
DECLARE @YrMoDy datetime	= @Yr + '-' + @Mo + '-' + @Dy + ' ' + @Hr + ':' + @Mi
DECLARE @TimeToGo VARCHAR(5)	= CAST(CAST(@Hr as int) - 12 as VARCHAR) + ':' + @Mi
------------------------------------------
--3rd RECORD
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

SELECT * FROM [RedBone].[main].[TimeClockEntry] WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com') AND [ClockIn] >= CAST(GETDATE() AS DATE) AND [ClockIn] < DATEADD(DAY, 1, CAST(GETDATE() AS DATE)) order by EntryId desc


--SELECT * FROM [RedBone].[main].[TimeClockEntry] where personid = 2775 order by entryid desc

--SELECT * FROM [RedBone].[main].[TimeClockEntry] WHERE EntryId = @EntryId
	
--SELECT * FROM [RedBone].[main].[TimeClockEntry] WHERE EntryId = @EntryId

--UPDATE [RedBone].[main].[TimeClockEntry] SET ClockInAdj = null WHERE EntryId = @EntryId




DECLARE @emailName2 NVARCHAR(25) = 'danny'; 
-------------------------------------------------------------------------------------------------------------------------------------------------





--Set dates manually
DECLARE @EntryId INTEGER			= 27233




			--IN
			DECLARE @ClockedIn NVARCHAR(25)		= '2024-06-14 06:59:40.160';
			--UPDATE [RedBone].[main].[TimeClockEntry] SET ClockIn = @ClockedIn WHERE EntryId = @EntryId




					
			--OUT
			DECLARE @ClockedOut NVARCHAR(25)	= '2024-06-13 22:22:22.222';
			UPDATE [RedBone].[main].[TimeClockEntry] SET ClockOut = @ClockedOut WHERE EntryId = @EntryId
			



-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT top 10 * FROM [RedBone].[main].[TimeClockEntry] WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName2 + '@redbonetrucking.com') order by EntryId desc
-------------------------------------------------------------------------------------------------------------------------------------------------





--XXX
--2024-06-13 16:28:45.770
