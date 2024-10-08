--218
DECLARE @emailName NVARCHAR(25) = 'danny';

WITH DailyRecords AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY CAST(ClockIn AS DATE) 
           ORDER BY ClockIn
         ) AS RowNum
  FROM [RedBone].[main].[TimeClockEntry]
)

SELECT *
FROM DailyRecords
WHERE RowNum = 1
ORDER BY ClockIn;	

