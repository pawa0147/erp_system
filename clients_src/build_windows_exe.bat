@echo off
echo ---------------------------------------------------
echo Webworks Monitor App Builder
echo ---------------------------------------------------
echo This script will convert the Python script into a standalone .exe file.
echo You need Python installed on this machine.
echo.

:: Check for Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not found in PATH. Please install Python first.
    pause
    exit /b
)

echo Installing PyInstaller...
pip install pyinstaller requests psutil pywin32

echo.
echo Building .exe...
pyinstaller --noconfirm --onefile --console --name "WebworksMonitor" --icon "NONE" "desktop_monitor.py"

echo.
echo ---------------------------------------------------
echo Build Complete!
echo You can find the executable in the 'dist' folder.
echo Copy 'dist\WebworksMonitor.exe' to your employees' computers.
echo ---------------------------------------------------
pause
