@echo off
chcp 65001 >nul
title VANTIX - API + Website Launcher
cd /d "%~dp0"
echo Starting API and website in separate windows...
start "VANTIX API Server" "%ComSpec%" /k ""%~dp0api-server.bat""
start "VANTIX Website Server" "%ComSpec%" /k ""%~dp0web-server.bat""
echo.
if exist "D:\Users\HP\Downloads\ngrok-v3-stable-windows-amd64\ngrok.exe" (
    echo Starting ngrok tunnel to website port 8080...
    start "VANTIX ngrok" /min "D:\Users\HP\Downloads\ngrok-v3-stable-windows-amd64\ngrok.exe" http 8080 --url https://saddled-blissful-moustache.ngrok-free.dev
) else (
    echo [NOTICE] ngrok.exe not found. Local website: http://127.0.0.1:8080
)
echo.
echo Close each server window or press Ctrl+C in it to stop that component.
pause
