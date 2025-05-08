:: ┌──────────────────────────────────────────────────┐
:: │                 All praise to Allah              │
:: │                                                  |
:: │         🖋️  Script by: Sultan Ahmmed             |
:: │        📅  Date: May 8, 2025 : 4:40AM           │
:: │                                                  │
:: └──────────────────────────────────────────────────┘

@echo off
setlocal

cls

:: Set the virtual environment name
set VENV_DIR=venv

:: Check if virtual environment exists
if not exist "%VENV_DIR%\Scripts\activate.bat" (
    powershell -Command "Write-Host '[INFO] Creating virtual environment...' -ForegroundColor Yellow"
    python -m venv %VENV_DIR%
)

:: Activate the virtual environment
call "%VENV_DIR%\Scripts\activate.bat"

:: Check if livereload is installed
powershell -Command "Write-Host '[INFO] Checking Required modules is installed or Not?...' -ForegroundColor Yellow"

python -c "import livereload" 2>nul
python -c "import colorama" 2>nul
python -c "import tqdm" 2>nul
if %errorlevel% neq 0 (
    powershell -Command "Write-Host '[INFO] Required Modules not found, installing...' -ForegroundColor Red"
    python.exe -m pip install --upgrade pip
    pip install livereload
    pip install colorama
    pip install tqdm
    cls
) else (
    powershell -Command "Write-Host '[INFO] Required Modules are already installed.' -ForegroundColor Green"
)

:: Ask user for the folder path
set /p SERVE_FOLDER=Path to folder (e.g., C:\Users\UserName\Desktop\Projects): 

:: Remove trailing backslash if present
if "%SERVE_FOLDER:~-1%"=="\" set SERVE_FOLDER=%SERVE_FOLDER:~0,-1%

:: Check if folder exists
if not exist "%SERVE_FOLDER%" (
    powershell -Command "Write-Host '[ERROR] The folder does not exist. Exiting...' -ForegroundColor Red"
    pause
    exit /b 1
)

:: Clear the screen after progress completes
cls

:: Run the live server with the provided folder path
python3 --version >nul 2>&1
if %errorlevel%==0 (
    python3 live_server.py "%SERVE_FOLDER%"
) else (
    python live_server.py "%SERVE_FOLDER%"
)

pause
endlocal