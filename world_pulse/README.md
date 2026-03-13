# 🌍 World Pulse (Weather Application)

<p align="center">
  <img src="https://github.com/oreskovs/Dart-Flutter-Projects/blob/main/world_pulse/lib/assets/Screenshot%202026-03-13%20091409.png">
  <img src="https://github.com/oreskovs/Dart-Flutter-Projects/blob/main/world_pulse/lib/assets/Screenshot%202026-03-13%20091434.png">
</p>

---

## 📝 Overview

**World Pulse** is a sophisticated weather application developed as part of the `Dart-Flutter-Projects` collection by **oreskovs**. It leverages modern Flutter techniques to provide users with accurate weather data and a 5-day forecast, all wrapped in a premium Glassmorphism interface.

---

## ✨ Features

- **Global Search**: Instantly find weather details for any city by tapping into the OpenWeather API.
- **Dynamic Backgrounds**: The app's theme adapts in real-time to weather conditions (e.g., Orange for Clear, Indigo for Rain).
- **Extended Forecast**: A horizontal scrollable list providing a glance at the next 5 days of weather.
- **Responsive Layout**: Designed to handle screen resizing and keyboard appearance without UI overflows.

---

## 🛠️ Tech Stack & Architecture

- **Language**: Dart
- **Framework**: Flutter
- **State Management**: Riverpod
- **API Integration**: REST API via HTTP package
- **Environment Management**: `flutter_dotenv` for secure API key handling

---

## 🚀 Installation & Setup

Since this project is located within the `world_pulse` directory of the `Dart-Flutter-Projects` repository, follow these steps:

1. **Navigate to the project folder**:
   ```bash
   cd world_pulse
   Install dependencies:
   ```

Bash
flutter pub get
Configure API Key:
Create a .env file inside the world_pulse folder:

Code snippet
OPENWEATHER_API_KEY=your_api_key_here

Run the application:

Bash
flutter run

🛡️ Security Note
The project is configured to ignore .env files via .gitignore to ensure that personal API keys are never leaked to the public repository.

<p align="center">
Maintained by <a href="https://www.google.com/search?q=https://github.com/oreskovs">oreskovs</a>
</p>

