@echo off
setlocal enabledelayedexpansion

set "sqlDir=C:\Users\danny.call\zmiscRedbone\aPLATFORM_DEPLOY\1TOBEDEPLOYED\PAPERWORK REQUIRED\sql\Gen_PR_DB\sql"

for %%f in ("%sqlDir%\*.sql") do (
    	echo. & echo. & echo. & echo.*** "%%~nxf" ***& echo.
		sqlcmd -S .\SQLEXPRESS -E -i "%%f"
)

pause