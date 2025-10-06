#!/bin/bash
# Build script for Windows (cross-platform build or run on Windows with Git Bash)

echo "=== Daily Maker - Windows Build Script ==="
echo ""

# Check if pyinstaller is installed
if ! command -v pyinstaller &> /dev/null
then
    echo "PyInstaller not found. Installing..."
    pip install pyinstaller
fi

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf build dist *.spec

# Build the application
echo "Building Daily Maker for Windows..."
pyinstaller --onefile \
    --windowed \
    --name "DailyMaker" \
    --add-data "config.json;." \
    --hidden-import PIL._tkinter_finder \
    --icon=NONE \
    daily_maker_gui.py

# Check if build was successful
if [ -f "dist/DailyMaker.exe" ]; then
    echo ""
    echo "✓ Build successful!"
    echo "Executable location: dist/DailyMaker.exe"
    echo ""
    echo "Note: Run this on Windows or use Wine to test"
else
    echo ""
    echo "✗ Build failed!"
    exit 1
fi
