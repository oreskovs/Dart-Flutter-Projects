# 🛒 ZenStore Mobile

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Riverpod-9042F5?style=for-the-badge&logo=riverpod&logoColor=white" alt="Riverpod">
</p>

**ZenStore Mobile** is a modern, high-performance e-commerce application built with **Flutter** and **Dart**. It showcases a complete user journey, from dynamic product discovery to a fully functional shopping cart system. This project serves as a core part of my portfolio in the [Dart-Flutter-Projects](https://github.com/oreskovs/Dart-Flutter-Projects) repository.

---

## ✨ Key Features

- **🎯 Real-time Product Feed:** Dynamic data fetching from [Fake Store API](https://fakestoreapi.com/).
- **❤️ Smart Favorites:** Toggle and persist your favorite items locally.
- **🛒 Advanced Cart Logic:** - Real-time quantity updates (Add/Remove/Delete).
  - Automatic subtotal and total calculations.
  - Interactive **Badge Notifications** on the cart icon.
- **✅ Seamless Checkout:** Mockup checkout process with automatic cart clearing logic.
- **💾 Data Persistence:** Uses `shared_preferences` to ensure your data stays safe after app restarts.

---

## 🛠 Tech Stack & Architecture

The project is built using **Clean Architecture** (Data, Domain, Presentation layers) to ensure scalability and testability.

| Tool             | Purpose                                 |
| :--------------- | :-------------------------------------- |
| **Riverpod**     | State Management & Dependency Injection |
| **GoRouter**     | Declarative Routing & Navigation        |
| **HTTP**         | API Communication                       |
| **Shared Prefs** | Local Storage / Persistence             |

---
