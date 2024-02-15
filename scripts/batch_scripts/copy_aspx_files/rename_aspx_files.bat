@echo off

set sFromDir=C:\Users\danny.call\source\repos\redboneplatform\RedBonePlatform\RedBonePlatform\Pages\ContainerPages\
set sToDir=%CD%

set sAspxFile=PersonEdit_Personal.aspx
set sCsFile=PersonEdit_Personal.aspx.cs
set sDesignerFile=PersonEdit_Personal.aspx.designer.cs

for /f "tokens=2 delims==" %%I in ('wmic OS Get localdatetime /value') do set datetime=%%I
set sDatestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%
set sTimestamp=%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%
set sDateTimeApendix=_%sDatestamp%_%sTimestamp%.txt

set sAspxPath=%sFromDir%%sAspxFile%
set sCsPath=%sFromDir%%sCsFile%
set sDesignerPath=%sFromDir%%sDesignerFile%

copy /Y %sAspxPath% %sToDir%\%sAspxFile%%sDateTimeApendix%
copy /Y %sCsPath% %sToDir%\%sCsFile%%sDateTimeApendix%
copy /Y %sDesignerPath% %sToDir%\%sDesignerFile%%sDateTimeApendix%

REM pause
