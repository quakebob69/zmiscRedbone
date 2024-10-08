--218
DECLARE @emailName NVARCHAR(25) = 'danny';

WITH DailyRecords AS (
  SELECT ClockIn,
         ROW_NUMBER() OVER (
           PARTITION BY CAST(ClockIn AS DATE) 
           ORDER BY ClockIn
         ) AS RowNum
  FROM [RedBone].[main].[TimeClockEntry]
  WHERE
			personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com'
							and
			DATEPART(HOUR, ClockIn) <= 8))



/*
SELECT *
FROM DailyRecords
WHERE RowNum = 1
ORDER BY ClockIn;	
*/


SELECT CAST(
  DATEADD(
    MILLISECOND,
    AVG(DATEDIFF(MILLISECOND, '00:00:00', CAST(ClockIn AS TIME))),
    '00:00:00'
  ) AS TIME
) AS AverageTime
FROM DailyRecords


--SELECT CAST(AVG(CAST(ClockIn AS FLOAT)) AS DATETIME) AS AverageDateTime FROM DailyRecords





