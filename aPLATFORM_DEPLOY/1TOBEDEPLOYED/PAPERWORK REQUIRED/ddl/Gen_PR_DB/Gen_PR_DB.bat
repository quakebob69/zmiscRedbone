@echo off
setlocal enabledelayedexpansion

rem TEMP TABLES
cd /d "C:\Users\danny.call\zmiscRedbone\aPLATFORM_DEPLOY\1TOBEDEPLOYED\PAPERWORK REQUIRED\ddl\Gen_PR_DB___TEMP_TABLES\"
call zzztempdannydeletethisafterproject_____CREATE.bat

set "sqlDir=C:\Users\danny.call\zmiscRedbone\aPLATFORM_DEPLOY\1TOBEDEPLOYED\PAPERWORK REQUIRED\ddl\Gen_PR_DB\sql"
for %%f in ("%sqlDir%\*.sql") do (
    	echo. & echo. & echo. & echo.*** "%%~nxf" ***& echo.
		rem local
			rem sqlcmd -S .\SQLEXPRESS -E -i "%%f"
		rem remote
			sqlcmd -S 40.78.62.55 -U redboneDB3 -P Kd2GP#Wlrt9Ws -d RedboneThomas -i "%%f"
)

pause