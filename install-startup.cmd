@echo off
setlocal
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
echo Installing startup launcher...
copy /Y "%~dp0start-all.cmd" "%STARTUP%\portfolio-start.cmd" >nul
echo Installed: %STARTUP%\portfolio-start.cmd
echo It will run at login.
