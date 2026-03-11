# 🌊 HabitFlow

**HabitFlow** is a modern, minimalist habit-tracking application built with **Flutter** and **Riverpod**. This project was developed as part of an advanced deep-dive into state management, data persistence, and clean UI/UX patterns in Flutter.

---

## ✨ Features

- **Full CRUD Operations:** Add, view, edit, and delete habits with ease.
- **Daily Progress Tracking:** A dynamic progress bar that calculates your success rate in real-time.
- **Persistence:** All habits and settings (including themes) are saved locally using `shared_preferences`, ensuring no data loss on restart.
- **Adaptive Theming:** Supports both **Dark & Light Modes** with a smooth toggle, remembering your preference.
- **Intuitive UI:** Clean design with visual cues like strike-through text and color changes for completed tasks.

## 🛠 Tech Stack

- **Framework:** [Flutter](https://flutter.dev)
- **State Management:** [Riverpod](https://riverpod.dev)
- **Local Storage:** [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **Design Pattern:** StateNotifier (Immutable State)

## 📸 Screenshots

| Light Mode                                                                                                                     | Dark Mode                                                                                                                    |
| ------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| ![Light Mode](https://github.com/oreskovs/Dart-Flutter-Project/blob/main/HabitFlow/assets/screenshots/light_mode.png?raw=true) | ![Dark Mode](https://github.com/oreskovs/Dart-Flutter-Project/blob/main/HabitFlow/assets/screenshots/dark_mode.png?raw=true) |

## 📁 Project Structure

```text
lib/
├── data/               # Local storage services (Shared Preferences)
├── domain/             # Data models and business logic
├── providers/          # Riverpod StateNotifiers & providers
└── ui/                 # Screens, dialogs, and reusable widgets

🚀 Getting Started
Clone the repository:
 git clone [https://github.com/oreskovs/Dart-Flutter-Project.git](https://github.com/oreskovs/Dart-Flutter-Project.git)

git clone [https://github.com/oreskovs/Dart-Flutter-Project.git](https://github.com/oreskovs/Dart-Flutter-Project.git)

Navigate to the project directory:
 cd HabitFlow

Install dependencies:
 flutter pub get

Run the application:
 flutter run


👨‍💻 Developed by oreskovs
```
