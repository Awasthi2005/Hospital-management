# Start Backend in a new terminal window
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\backend'; node server.js"

# Start Frontend in a new terminal window
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\frontend'; npm.cmd run dev"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " AHMS Application Started Successfully!   " -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Frontend UI:  http://localhost:5173" -ForegroundColor Yellow
Write-Host "Backend API:  http://localhost:5000" -ForegroundColor Yellow
