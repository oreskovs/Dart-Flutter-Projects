# 📱 Gadget Store App - MVP

This is a modern **E-commerce** mobile application for high-end technology, built with **Flutter** and **Riverpod**. The project is designed with a focus on performance, scalability, and a premium user experience.

## 🚀 Key Features
* **Secure Auth Flow**: Complete UI/UX for Login and Registration with integrated navigation logic.
* **Advanced Filtering**: Real-time product filtering by categories (Mobiles, Laptops, Accessories).
* **State Management**: Full cart logic (Add-to-cart, remove, and price calculation) managed via **Riverpod**.
* **Premium UI**: Immersive interface featuring **Hero** animations, **Sliver** effects, and a centralized theme system.
* **Scalable Architecture**: Adheres to **Clean Architecture** principles, making it ready for integration with real-world Backends (Firebase or REST APIs).

## 🛠 Tech Stack
* **Framework**: Flutter
* **Language**: Dart
* **State Management**: Riverpod
* **Navigation**: GoRouter
* **Theming**: Custom Dark Theme

## 📂 Project Structure
The project is organized by features to ensure maintainability:

lib/
 
 ├── core/          # Global themes, constants, and shared configurations
 
 ├── features/      # Feature-based modules (auth, products, cart)
 
 │    ├── data/     # Repositories and Mock data sources
 
 │    ├── domain/   # Data models and entities
 
 │    └── presentation/ # UI screens, providers, and widgets
 
 └── main.dart      # App entry point and GoRouter setup
 

How to Run

1. Clone the repository:

    -git clone https://github.com/oreskovs/Dart-Flutter-Projects.git
  

2. Navigate to the project directory:

    -cd gadgets_store


3. Install dependencies:

    -flutter pub get

4. Launch the application:
  
    -flutter run 
  
👤 Author

oreskovs - GitHub Profile
