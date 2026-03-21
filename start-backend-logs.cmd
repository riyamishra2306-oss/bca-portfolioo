@echo off
setlocal
cd /d "%~dp0backend"
echo Starting backend (logging to ..\logs\backend.log)...
npm start >> ..\logs\backend.log 2>&1
