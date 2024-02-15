@echo off

echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. 
set sqldir=



	set sqlfile=reset_staging_data.sql
	echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
	sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%



echo. & echo. & echo. & echo.WE GOT TO THE END OF THE SCRIPT!!!echo. & echo.
REM pause