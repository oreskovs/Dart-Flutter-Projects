# Crypto Tracker 🚀

A real-time Cryptocurrency tracking application built with **Flutter** and **Dart**. This app fetches live market data from the **CoinGecko API** to provide users with up-to-date information on the top 10 cryptocurrencies by market capitalization.

## 📱 Features

* **Live Market Data**: Fetches real-time prices, market caps, and 24h price changes.
* **Dynamic UI**: Lists the top 10 coins with automatic ranking updates.
* **Detailed View**: Specific screen for each coin showing expanded statistics and icons.
* **Dark & Light Mode**: User-controllable theme switching for a personalized experience.
* **Pull-to-Refresh**: Easily update data with a simple swipe gesture.
* **Robust Error Handling**: Implements null-safety and data validation for API responses.

## 🛠️ Built With

* **Flutter**: UI Toolkit for building beautiful apps.
* **Dart**: The programming language behind Flutter.
* **Http Package**: For making network requests to the API.
* **CoinGecko API**: Providing reliable cryptocurrency market data.

## 🚀 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/oreskovs/Dart-Flutter-Projects/tree/main/Crypto%20Tracker%20App]
    ```
2.  **Navigate to the project directory**:
    ```bash
    cd crypto_tracker
    ```
3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
4.  **Run the app**:
    ```bash
    flutter run
    ```

## 🏗️ Project Structure

* `lib/main.dart`: Entry point and global theme management.
* `lib/home_screen.dart`: Main dashboard with the cryptocurrency list and refresh logic.
* `lib/details_screen.dart`: UI for viewing individual coin statistics.
* `lib/coin_model.dart`: Data model and JSON factory logic for parsing API data.

## 📄 License

This project is open-source and available under the MIT License.