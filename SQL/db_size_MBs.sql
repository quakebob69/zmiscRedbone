SELECT 
    DB_NAME(database_id) AS DatabaseName,
    CAST(SUM(CASE WHEN type_desc = 'ROWS' THEN size END) * 8. / 1024 AS DECIMAL(10,2)) AS DataSizeMB
FROM sys.master_files
WHERE DB_NAME(database_id) = 'RedBone'
GROUP BY database_id