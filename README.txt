# 📚 Dart Library Management System

This is a simple console application built with Dart that simulates a basic library management system. It models key entities like **Books**, **Users**, and the **Library** itself, allowing for operations such as adding books, registering users, borrowing, and returning books.

## ✨ Features

* **Book Management:** Add new books to the library, each with a title and author.
* **Availability Tracking:** Books have a boolean status (`isAvailable`) that tracks whether they are currently on the shelf or borrowed.
* **User Registration:** Add new users to the system.
* **Borrowing Functionality:** Users can borrow available books, updating the book's status and tracking which books each user has.
* **Returning Functionality:** Users can return books, making them available again in the library.
* **Display Functions:** View all available books in the library and display the list of books a specific user has borrowed.

## 🚀 Getting Started

### Prerequisites

You need to have the Dart SDK installed on your machine.

### Installation

1.  **Clone the repository** (if it were hosted on GitHub):
    ```bash
    git clone [dart-flutter-projects/Dart Library Management System]
    cd dart-library-management-system
    ```

2.  **Run the application** from the `main.dart` file:
    ```bash
    dart run main.dart
    ```

## 📂 Project Structure

The project is structured into four main files, each representing a core class in the system:

* `Book.dart`: Defines the `Book` class, responsible for tracking a book's title, author, and availability status. It includes methods for borrowing and returning a specific book.
* `User.dart`: Defines the `User` class, which tracks the user's name and the list of books they currently have borrowed. It contains the logic for a user to `borrow` or `returnBook`.
* `Library.dart`: Defines the central `Library` class. It manages lists of all `Book` objects and all `User` objects. It includes methods to add books, add users, and display currently available books.
* `main.dart`: The entry point of the application where the system is initialized, objects are created, and core functionalities are demonstrated.

## 💻 Example Usage (from `main.dart`)

The `main.dart` file demonstrates the following sequence of operations:

1.  A `Library` instance is created.
2.  Three `Book` objects are created and added to the library.
3.  Two `User` objects are created and added to the library.
4.  The list of initially available books is displayed.
5.  `user1` borrows "1984" and `user2` borrows "The Great Gatsby".
6.  The lists of borrowed books for both users are displayed.

### Expected Console Output