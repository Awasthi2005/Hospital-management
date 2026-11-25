@echo off
title AHMS Launcher
echo ===================================================
echo Starting Advanced Hospital Management System (AHMS)
echo ===================================================

echo Starting Backend Server on port 5000...
start "AHMS Backend (Port 5000)" cmd /k "cd backend && node server.js"

echo Starting Frontend Server on port 5173...
start "AHMS Frontend (Port 5173)" cmd /k "cd frontend && npm.cmd run dev"

echo.
echo Both servers have been launched in separate terminal windows!
echo - Frontend UI: http://localhost:5173
echo - Backend API: http://localhost:5000
echo ===================================================
