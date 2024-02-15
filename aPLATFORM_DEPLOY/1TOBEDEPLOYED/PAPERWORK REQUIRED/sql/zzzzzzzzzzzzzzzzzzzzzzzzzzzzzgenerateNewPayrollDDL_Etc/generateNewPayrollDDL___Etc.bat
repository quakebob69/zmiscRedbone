@echo off

echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. 
set sqldir=../

REM --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
REM --TEMPLATE
REM 	--set sqlfile=ASDF
REM 	--ASDF
REM 	--ASDF
REM --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


REM --#####################################################################################################################
REM ----------------------------
		set sqlfile=000010---DROP_NEW_DDL.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%

		set sqlfile=000020---payroll_SCHEMA___CREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%



REM ----------------------------
		set sqlfile=100---PayrollOTRStatus___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
		
		set sqlfile=110.0---PayrollOTRPayPeriod___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
		
		set sqlfile=110.1---PayrollOTRPayPeriod___INSERT.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
		
		set sqlfile=120---PayrollOTRStaging___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
		
		
		
REM ----------------------------	
		set sqlfile=210---sp_Payroll_OTR_GetPayRecordsFrom__DriverPay___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
		
		set sqlfile=220---sp_Payroll_OTR_GetPayRecordsFrom__Load___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
		
		set sqlfile=230---sp_Payroll_OTR_StagePayRecords__DriverPay___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
		
		set sqlfile=240---sp_Payroll_OTR_StagePayRecords__Load___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
				
		set sqlfile=245---sp_Payroll_OTR_StagePayRecords__ALL___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
				

		set sqlfile=250---sp_PayrollPTO_OTR_Accrual___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%

		set sqlfile=260---sp_PayrollPTO_Admin_Accrual___DROPCREATE.sql
		echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
		sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%
REM --#####################################################################################################################
		



	
								REM ----------------------------
									set sqlfile=99999999999--SOMETEMPSHIZ.sql
									echo. & echo. & echo. & echo.*** %sqlfile% ***& echo.------------------------------------
									sqlcmd -S .\SQLEXPRESS -E -i %sqldir%%sqlfile%





echo. & echo. & echo. & echo.WE GOT TO THE END OF THE SCRIPT!!!echo. & echo.
REM pause
