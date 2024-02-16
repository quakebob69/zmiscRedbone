@echo off
setlocal enabledelayedexpansion

set "sqlDir=C:\Users\danny.call\zmiscRedbone\aPLATFORM_DEPLOY\1TOBEDEPLOYED\PAPERWORK REQUIRED\sql"

for %%f in ("%sqlDir%\*.sql") do (
    	echo. & echo. & echo. & echo.*** "%%f" ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i "%%f"
)

pause