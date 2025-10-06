# Daily Maker with AI 🤖📊

An intelligent desktop application that monitors your activity, analyzes context with AI, and generates structured daily reports.

![Version](https://img.shields.io/badge/version-3.5-blue)
![Python](https://img.shields.io/badge/python-3.8+-green)
![License](https://img.shields.io/badge/license-MIT-orange)

## 🌟 Features

- **Automatic Monitoring**: Captures screenshots every 5 minutes
- **AI Analysis**: Uses Google Gemini to analyze and describe activities
- **Structured Reports**: Generates morning and afternoon summaries
- **Always Visible Banner**: Status indicator with visual feedback on each capture
- **Intuitive Interface**: Tabbed GUI for easy navigation
- **Flexible Configuration**: Customize schedules, languages, and AI models
- **Security**: Option to show/hide API key
- **Customizable Templates**: Define your own report format

## 📋 Requirements

- Python 3.8 or higher
- Google Gemini API Key ([get it here](https://ai.google.dev/))
- Operating system: Linux or Windows

## 🚀 Installation

### Option 1: Use Pre-compiled Executable (Recommended)

1. Download the executable for your system:
   - **Linux**: `DailyMaker` (no extension)
   - **Windows**: `DailyMaker.exe`

2. Run the file
   - **Linux**: `./DailyMaker`
   - **Windows**: Double-click `DailyMaker.exe`

### Option 2: Run from Source Code

```bash
# Clone the repository
git clone https://github.com/DannyahIA/ai-daily-resume.git
cd ai-daily-resume

# Install dependencies
pip install -r requirements.txt

# Run the application
python daily_maker_gui.py
```

## 🔨 Build from Scratch

If you want to build the application yourself:

### Linux
```bash
chmod +x build_linux.sh
./build_linux.sh
```

### Windows
```bash
# In CMD or PowerShell
build_windows.bat

# Or in Git Bash
chmod +x build_windows.sh
./build_windows.sh
```

For more details, see [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)

## ⚙️ Configuration

1. **Get your Gemini API Key**
   - Go to [Google AI Studio](https://ai.google.dev/)
   - Create a free API key

2. **Configure the Application**
   - Go to the "Settings" tab
   - Enter your name
   - Paste your API Key
   - Adjust report times (format HH:MM)
   - Choose the summary language
   - (Optional) Customize AI models
   - Click "Save Settings"

3. **Start Monitoring**
   - Click "Start Monitoring"
   - The status banner will appear
   - Every 5 minutes, a capture will be made (banner flashes green)

## 📊 How It Works

1. **Capture**: Every 5 minutes, the app takes a screenshot
2. **Analysis**: Google Gemini analyzes the image and identifies the activity
3. **Logging**: The activity is recorded with a timestamp in the logs
4. **Summaries**: At configured times, generates reports:
   - **Morning**: Summarizes morning activities
   - **Afternoon**: Summarizes afternoon activities and compiles the whole day
5. **Editing**: You can edit the final report before sending it

## 🎨 Interface

### "Daily Summary" Tab
Displays the AI-generated report. You can edit the text before copying/sending.

### "AI Logs" Tab
Shows in real time the activities identified by the AI.

### "Settings" Tab
Full configuration:
- User name
- API Key (with show/hide button)
- Report times
- Language (Portuguese/English)
- Customizable AI models
- Report template
- Monitoring controls

## 🔒 Privacy and Security

- ✅ All captures are processed locally
- ✅ Images are sent only to the Google Gemini API
- ✅ No data is stored on external servers
- ✅ You control when monitoring is active
- ✅ API Key stored locally in `config.json`
- ⚠️ Keep your `config.json` file safe

## 🛠️ Troubleshooting

### "API ERROR" in logs
- Check if your API Key is correct
- Confirm you have available credits on Google AI
- Check your internet connection

### Banner does not appear
- Click the "Show Banner" button
- Check if monitoring is active

### Reports are not generated
- Make sure times are in HH:MM (24h) format
- Wait for the configured time
- Check if there are activities recorded in the logs

### Executable does not start (Linux)
```bash
chmod +x DailyMaker
./DailyMaker
```

### Antivirus blocks (Windows)
- Add an exception for the executable
- The file is safe (source code available)

## 🔄 Supported AI Models

### For Image Analysis (Vision Model):
- `gemini-1.5-flash-latest` (default, fast)
- `gemini-1.5-pro-latest` (more accurate)
- `gemini-pro-vision`

### For Text Generation (Text Model):
- `gemini-1.5-flash-latest` (default, fast)
- `gemini-1.5-pro-latest` (more elaborate)
- `gemini-pro`

## 📝 Custom Template

The template supports the following variables:
- `[USER_NAME]`: Your name
- `[DATE]`: Current date
- `[MORNING_UPDATES]`: Morning summary
- `[AFTERNOON_UPDATES]`: Afternoon summary

Example:
```markdown
# Daily Summary – [USER_NAME] – [DATE]
## Morning Updates:
[MORNING_UPDATES]

## Afternoon Updates:
[AFTERNOON_UPDATES]
```

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests

## 📄 License

This project is under the MIT license. See the LICENSE file for more details.

## 👨‍💻 Author

**Tavares**
- GitHub: [@DannyahIA](https://github.com/DannyahIA)

## 🙏 Acknowledgements

- Google Gemini API for providing AI capabilities
- Python community for amazing libraries

---

**Current version**: 3.5  
**Last update**: October 2025

⭐ If this project was helpful, consider giving it a star on GitHub!

