-- caculate lunch time from first 2 records
--create column that says how many more minutes
-- ADD LUNCH to estimate????

------------------------------------------
DECLARE @emailName NVARCHAR(25) = 'danny';

	------------------------------------------
	DECLARE @Yr VARCHAR(4)		= '2024'
		DECLARE @Mo VARCHAR(2)		= '02'
			DECLARE @Dy VARCHAR(2)		= '13'

		------------------------------------------
		DECLARE @Hr VARCHAR(2)		= '17'
			DECLARE @Mi VARCHAR(2)		= '00'


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



-------------------------------------------------------------------------------------------------------------------------------------------------
--Set dates manually
DECLARE @EntryId INTEGER			= 23322
	DECLARE @ClockedIn NVARCHAR(25)		= '2024-02-13 12:14:28.238';
		DECLARE @ClockedOut NVARCHAR(25)	= '2024-02-13 11:22:32.531';

				--SELECT * FROM [RedBone].[main].[TimeClockEntry] where personid = 2775 order by entryid desc

--SELECT * FROM [RedBone].[main].[TimeClockEntry] WHERE EntryId = @EntryId
	--ClockIn--------------------------	UPDATE [RedBone].[main].[TimeClockEntry] SET ClockIn = @ClockedIn WHERE EntryId = @EntryId
	--ClockOut************************* UPDATE [RedBone].[main].[TimeClockEntry] SET ClockOut = @ClockedOut WHERE EntryId = @EntryId
--SELECT * FROM [RedBone].[main].[TimeClockEntry] WHERE EntryId = @EntryId

					
					
					--UPDATE [RedBone].[main].[TimeClockEntry] SET ClockInAdj = null WHERE EntryId = @EntryId