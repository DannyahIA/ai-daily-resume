# Daily Maker - Build Instructions

This document explains how to generate executables for the Daily Maker application for Linux and Windows.

## Requirements

- Python 3.8 or higher
- pip (Python package manager)

## Installing Dependencies

Before building, install the required dependencies:

```bash
pip install -r requirements.txt
pip install pyinstaller
```

## Build for Linux

### Option 1: Using the shell script
```bash
chmod +x build_linux.sh
./build_linux.sh
```

### Option 2: Manual command
```bash
pyinstaller --onefile --windowed --name "DailyMaker" --add-data "config.json:." --hidden-import PIL._tkinter_finder daily_maker_gui.py
```

The executable will be generated at: `dist/DailyMaker`

### Run on Linux
```bash
./dist/DailyMaker
```

## Build for Windows

### On Windows (using CMD or PowerShell):

#### Option 1: Using the .bat file
```cmd
build_windows.bat
```

#### Option 2: Manual command
```cmd
pyinstaller --onefile --windowed --name "DailyMaker" --add-data "config.json;." --hidden-import PIL._tkinter_finder daily_maker_gui.py
```

### On Windows (using Git Bash):
```bash
chmod +x build_windows.sh
./build_windows.sh
```

The executable will be generated at: `dist/DailyMaker.exe`

## Cross-platform Build

**Important note:** PyInstaller generates executables specific to the platform where it is run. To generate executables for both platforms:

1. **Build for Linux:** Run the build script on a Linux system
2. **Build for Windows:** Run the build script on a Windows system

Alternatively, you can use:
- Docker/VM with Windows to generate the Windows executable from Linux
- Wine (not recommended for GUI applications)

## Structure after Build

```
daily-maker/
├── build/              # Temporary files (can be deleted)
├── dist/               # Final executables
│   ├── DailyMaker      # Linux
│   └── DailyMaker.exe  # Windows
├── config.json
├── daily_maker_gui.py
└── requirements.txt
```

## Distribution

To distribute the application:

1. **Linux:** Copy the `dist/DailyMaker` file and `config.json`
2. **Windows:** Copy the `dist/DailyMaker.exe` file and `config.json`

The `config.json` file is optional, but recommended to keep default settings.

## Troubleshooting

### Error: "ModuleNotFoundError"
- Install all dependencies: `pip install -r requirements.txt`

### Error: "PIL._tkinter_finder not found"
- This is a known issue. The `--hidden-import` flag in the command already solves it.

### Executable too large
- Use `--onefile` to create a single executable
- To reduce size, use: `pyinstaller --onefile --strip` (Linux)

### On Linux: "Permission denied"
- Make the executable file executable: `chmod +x dist/DailyMaker`

### Application does not start on Windows
- Check if antivirus is blocking it
- Run as administrator if necessary

## Customization

You can add a custom icon:

```bash
# Linux
pyinstaller --onefile --windowed --icon=icon.ico --name "DailyMaker" daily_maker_gui.py

# Windows
pyinstaller --onefile --windowed --icon=icon.ico --name "DailyMaker" daily_maker_gui.py
```

## Testing

After building, test the executable:

1. Configure the Gemini API key
2. Enter your name
3. Click "Start Monitoring"
4. Check if the banner appears
5. Wait for a screenshot
6. Check the logs

## License and Distribution

Be sure to include appropriate license information when distributing the application.
