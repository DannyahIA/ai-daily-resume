#!/bin/bash
# Build script for Linux

echo "=== Daily Maker - Linux Build Script ==="
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
echo "Building Daily Maker for Linux..."
pyinstaller --onefile \
    --windowed \
    --name "DailyMaker" \
    --add-data "config.json:." \
    --hidden-import PIL._tkinter_finder \
    daily_maker_gui.py

# Check if build was successful
if [ -f "dist/DailyMaker" ]; then
    echo ""
    echo "✓ Build successful!"
    echo "Executable location: dist/DailyMaker"
    echo ""
    echo "To run: ./dist/DailyMaker"
else
    echo ""
    echo "✗ Build failed!"
    exit 1
fi
