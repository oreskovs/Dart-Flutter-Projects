# 👥 Employee Management System

A robust and interactive **Flutter** application designed to manage employee records efficiently. This project demonstrates core Flutter concepts, including state management, dynamic list rendering, and Object-Oriented Programming (OOP) principles in Dart.

## 🚀 Key Features

- **Dynamic List Rendering:** Utilizes `ListView.builder` for efficient scrolling and memory management.
- **Object-Oriented Architecture:** Implements a clear hierarchy with `Employee` and `Manager` classes, utilizing inheritance and polymorphism.
- **Interactive UI Components:**
  - **Add Employees:** Quick entry of new staff using a `FloatingActionButton`.
  - **Swipe-to-Delete:** Intuitive record removal via the `Dismissible` widget.
  - **Custom Notifications:** Real-time feedback provided through `SnackBar` alerts.
- **Conditional Styling:** Distinct visual representation (colors and icons) to differentiate between Managers and standard Employees.
- **Error Handling:** Robust data parsing using `try-catch-finally` blocks to ensure application stability.

## 🛠 Tech Stack

- **Framework:** [Flutter](https://flutter.dev)
- **Language:** [Dart](https://dart.dev)

## 📂 Project Structure

Following a clean and modular architecture as shown in the project files:

- `lib/employee.dart` - Core Employee data model.
- `lib/manager.dart` - Manager model inheriting from Employee.
- `lib/home_screen.dart` - Primary UI containing the logic for the employee list.
- `lib/main.dart` - Application entry point.

## 🏁 Getting Started

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/oreskovs/employee_management.git]
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the application:**
    ```bash
    flutter run
    ```

---

_Developed as part of a Flutter technical advancement track._
