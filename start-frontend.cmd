@echo off
setlocal
cd /d "%~dp0"
echo Starting frontend on port 3000...
node scripts\serve-frontend.js
