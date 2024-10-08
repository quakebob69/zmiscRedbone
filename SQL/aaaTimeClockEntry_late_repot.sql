DECLARE @emailName NVARCHAR(25) = 'danny';

WITH DailyRecords AS (
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
FROM DailyRecords
WHERE RowNum = 1