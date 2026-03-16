# 🎬 MovieBox - Flutter Movie Explorer

**MovieBox** is a modern Flutter application designed for searching and discovering movies in real-time. By leveraging the **OMDb API**, the app provides detailed information about films, including ratings, plots, and cast members. This project focuses on advanced state management and building a robust, reactive user interface.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

---

## ✨ Features

- 🔍 **Smart Search**: Instant movie lookup using the `searchQueryProvider` to fetch data dynamically from the OMDb API.
- 📖 **Detailed Insights**: View comprehensive movie details, including IMDb ratings, release dates, plot summaries, and director information.
- ❤️ **Favorites System**: A personalized watchlist feature powered by Riverpod `StateNotifier`, allowing users to add or remove movies with persistent logic.
- 🛡️ **Robust Error Handling**: Implemented custom `errorBuilder` and `loadingBuilder` logic to handle 404 image errors and provide a smooth user experience during network delays.
- 📱 **Reactive UI**: The interface automatically synchronizes across different screens whenever the state changes.

---

## 🛠 Technical Overview

### State Management

The app utilizes **Riverpod** for a clean, scalable architecture:

- **FutureProvider**: Handles asynchronous API calls and manages loading/error states for the movie list.
- **StateNotifierProvider**: Manages the favorite movies list using immutable state updates.
- **StateProvider**: Tracks the user's search input to trigger reactive API updates.

### API Integration

Communication with the backend is handled via a dedicated `MovieApiService`. This service processes HTTP requests and maps complex JSON responses into clean Dart models for use within the UI.

---

## 🚀 Getting Started

1. Clone the repository to your local machine.
2. Ensure you have a valid **OMDb API Key**.
3. Set up your environment or replace the API key in the service file.
4. Run the following commands in your terminal:

```bash
flutter pub get
flutter run
📸 PreviewHome ScreenMovie DetailsFavorites Watchlist🤝 ContactStojance Reskov - GitHub ProfileBuilt with ❤️ using Flutter and Riverpod.
---

### Pro-Tips for your GitHub:
* **Screenshots**: Replace the placeholder links in the table with actual screenshots of your app. You can upload the images to a folder named `screenshots` in your repo and link them like this: `./screenshots/home.png`.
* **Clean Code**: Before pushing, make sure to remove the `import 'package:flutter_riverpod/legacy.dart';` from your `movie_provider.dart` as it is no longer needed for your current implementation.

Would you like me to help you write a summary for your next project or perhaps prepare
```
