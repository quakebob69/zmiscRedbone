@echo off
setlocal enabledelayedexpansion

set "sqlDir=C:\Users\danny.call\zmiscRedbone\aPLATFORM_DEPLOY\1TOBEDEPLOYED\PAPERWORK REQUIRED\ddl\Gen_PR_DB\testdeletthis"

for %%f in ("%sqlDir%\*.sql") do (
    	echo. & echo. & echo. & echo.*** "%%~nxf" ***& echo.
		sqlcmd -S 40.78.62.55 -U redboneDB3 -P Kd2GP#Wlrt9Ws -d RedboneThomas -i "%%f"
)

pause