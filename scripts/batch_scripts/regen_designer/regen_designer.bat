@echo off

set sDir=C:\Users\danny.call\source\repos\redboneplatform\RedBonePlatform\RedBonePlatform\Pages\ContainerPages\
set sDesignerFile=PersonEdit_Personal.aspx.designer.cs
set sFullPath=%sDir%%sDesignerFile%
REM echo %sFullPath%

del %sFullPath%
fsutil file createnew %sFullPath% 0

pause
