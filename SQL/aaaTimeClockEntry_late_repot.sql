DECLARE @emailName NVARCHAR(25) = 'danny';


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
		AND DATEPART(HOUR, ClockIn) <= 8
	)
	SELECT CAST(
	  DATEADD(
		MILLISECOND,
		AVG(CAST(DATEDIFF(MILLISECOND, '00:00:00', CAST(ClockIn AS TIME)) AS BIGINT)),
		'00:00:00'
	  ) AS TIME
	) AS AverageArriveTime
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
		AND DATEPART(HOUR, ClockOut) >= 13
)
SELECT *
FROM DailyLeaveRecords
WHERE RowNum = 1
ORDER BY ClockOut;


	/*SELECT CAST(
	  DATEADD(
		MILLISECOND,
		AVG(CAST(DATEDIFF(MILLISECOND, '00:00:00', CAST(ClockIn AS TIME)) AS BIGINT)),
		'00:00:00'
	  ) AS TIME
	) AS AverageLeaveTime
	FROM DailyLeaveRecords
	WHERE RowNum = 1;*/