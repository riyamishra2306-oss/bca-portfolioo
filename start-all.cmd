@echo off
setlocal
cd /d "%~dp0backend"
echo Starting backend (logging to logs\backend.log)...
start "backend" cmd /k "node server.js >> ..\logs\backend.log 2>&1"

cd /d "%~dp0"
echo Starting frontend (logging to logs\frontend.log)...
start "frontend" cmd /k "node scripts\serve-frontend.js >> logs\frontend.log 2>&1"

echo Done. Open http://127.0.0.1:5000
