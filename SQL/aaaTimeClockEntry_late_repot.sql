--218
DECLARE @emailName NVARCHAR(25) = 'danny';

SELECT CAST(
  DATEADD(
    MILLISECOND,
    AVG(DATEDIFF(MILLISECOND, '00:00:00', CAST(yourDateTimeColumn AS TIME))),
    '00:00:00'
  ) AS TIME
) AS AverageTime
FROM [RedBone].[main].[TimeClockEntry];



SELECT CAST(
  DATEADD(
    MILLISECOND,
    AVG(DATEDIFF(MILLISECOND, '00:00:00', CAST(ClockIn AS TIME))),
    '00:00:00'
  ) AS TIME
) AS AVERAGE_TIME
FROM DailyRecords;


WITH DailyRecords AS (
  SELECT top 10 *,
         ROW_NUMBER() OVER (
           PARTITION BY CAST(ClockIn AS DATE) 
           ORDER BY ClockIn
         ) AS RowNum
  FROM [RedBone].[main].[TimeClockEntry]
		WHERE
			personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com')
							and
			DATEPART(HOUR, ClockIn) <=8)








				SELECT *
	FROM DailyRecords
	WHERE RowNum = 1
	ORDER BY ClockIn;



		SELECT
			COUNT(DISTINCT(DATEPART(DAYOFYEAR, ClockIn)))
		FROM
			[RedBone].[main].[TimeClockEntry]	
		WHERE
			personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com')


			/*
--ARRIVE
		SELECT
			SUM(DATEPART(MINUTE, ClockIn))
		FROM
			[RedBone].[main].[TimeClockEntry]	
		WHERE
			personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com')
				and
			DATEPART(HOUR, ClockIn) = 7		
			*/




--LEAVE
	