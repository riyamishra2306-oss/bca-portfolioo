@echo off
setlocal
cd /d "%~dp0"
echo Starting frontend (logging to logs\frontend.log)...
node scripts\serve-frontend.js >> logs\frontend.log 2>&1
