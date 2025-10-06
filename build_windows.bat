@echo off
REM Build script for Windows

echo === Daily Maker - Windows Build Script ===
echo.

REM Check if pyinstaller is installed
pyinstaller --version >nul 2>&1
if %errorlevel% neq 0 (
    echo PyInstaller not found. Installing...
    pip install pyinstaller
)

REM Clean previous builds
echo Cleaning previous builds...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
if exist *.spec del /q *.spec

REM Build the application
echo Building Daily Maker for Windows...
pyinstaller --onefile ^
    --windowed ^
    --name "DailyMaker" ^
    --add-data "config.json;." ^
    --hidden-import PIL._tkinter_finder ^
    daily_maker_gui.py

REM Check if build was successful
if exist "dist\DailyMaker.exe" (
    echo.
    echo Build successful!
    echo Executable location: dist\DailyMaker.exe
    echo.
) else (
    echo.
    echo Build failed!
    exit /b 1
)

pause
