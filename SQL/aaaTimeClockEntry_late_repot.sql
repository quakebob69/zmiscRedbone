DECLARE @emailName NVARCHAR(25) = 'danny';
DECLARE @AverageArriveTime TIME;
DECLARE @AverageLeaveTime TIME;



--Avg Arrive
	WITH DailyArriveRecords AS (
	  SELECT ClockIn,
			 ROW_NUMBER() OVER (
			   PARTITION BY CAST(ClockIn AS DATE) 
			   ORDER BY ClockIn
			 ) AS RowNum
	  FROM [RedBone].[main].[TimeClockEntry]
	  WHERE personid IN (SELECT PersonId 
						 FROM main.person 
						 WHERE LoginId = @emailName + '@redbonetrucking.com')
		AND DATEPART(HOUR, ClockIn) <= 9
		AND ClockIn >= '2023-11-30 07:28:30.210'
		AND ClockIn <= '2024-10-09 00:28:30.210'

	)
	SELECT @AverageArriveTime = CAST(
	  DATEADD(
		MILLISECOND,
		AVG(CAST(DATEDIFF(MILLISECOND, '00:00:00', CAST(ClockIn AS TIME)) AS BIGINT)),
		'00:00:00'
	  ) AS TIME
	) 
	FROM DailyArriveRecords
	WHERE RowNum = 1;



--Avg Leave
	WITH DailyLeaveRecords AS (
	  SELECT *,
			 ROW_NUMBER() OVER (
			   PARTITION BY CAST(ClockOut AS DATE) 
			   ORDER BY ClockOut DESC
			 ) AS RowNum
		  FROM [RedBone].[main].[TimeClockEntry]
		  WHERE personid IN (SELECT PersonId 
							 FROM main.person 
							 WHERE LoginId = @emailName + '@redbonetrucking.com')
			AND DATEPART(HOUR, ClockOut) >= 14
			AND ClockIn >= '2023-11-30 07:28:30.210'
			AND ClockIn <= '2024-10-09 00:28:30.210'
	)
	SELECT @AverageLeaveTime = CAST(
		DATEADD(
		MILLISECOND,
		AVG(CAST(DATEDIFF(MILLISECOND, '00:00:00', CAST(ClockOut AS TIME)) AS BIGINT)),
		'00:00:00'
		) AS TIME
	)
	FROM DailyLeaveRecords
	WHERE RowNum = 1;



--**************************************************************************
	SELECT @AverageArriveTime as 'Average Arrive Time';
	SELECT @AverageLeaveTime as 'Average Leave Time';
	SELECT ROUND(CAST(DATEDIFF(SECOND, @AverageArriveTime, @AverageLeaveTime) AS FLOAT) / 3600.0, 2) AS 'hours worked per day';
--**************************************************************************











--DETAILS
	--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	--Avg Arrive details
		WITH DailyArriveRecords AS (
		  SELECT ClockIn,
				 ROW_NUMBER() OVER (
				   PARTITION BY CAST(ClockIn AS DATE) 
				   ORDER BY ClockIn
				 ) AS RowNum
		  FROM [RedBone].[main].[TimeClockEntry]
		  WHERE personid IN (SELECT PersonId 
							 FROM main.person 
							 WHERE LoginId = @emailName + '@redbonetrucking.com')
			AND DATEPART(HOUR, ClockIn) <= 9
			AND ClockIn >= '2023-11-30 07:28:30.210'
			AND ClockIn <= '2024-10-09 00:28:30.210'
		)
		SELECT *
		FROM DailyArriveRecords
		WHERE RowNum = 1
		ORDER BY ClockIn;	




	--Avg Leave details
		WITH DailyLeaveRecords AS (
		  SELECT *,
				 ROW_NUMBER() OVER (
				   PARTITION BY CAST(ClockOut AS DATE) 
				   ORDER BY ClockOut DESC
				 ) AS RowNum
			  FROM [RedBone].[main].[TimeClockEntry]
			  WHERE personid IN (SELECT PersonId 
								 FROM main.person 
								 WHERE LoginId = @emailName + '@redbonetrucking.com')
				AND DATEPART(HOUR, ClockOut) >= 14
				AND ClockIn >= '2023-11-30 07:28:30.210'
				AND ClockIn <= '2024-10-09 00:28:30.210'
		)
		SELECT *
		FROM DailyLeaveRecords
		WHERE RowNum = 1
		ORDER BY ClockOut;	

