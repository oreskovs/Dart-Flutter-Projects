# Simple Dart ToDo CLI

A minimal Command-Line Interface (CLI) application built with Dart for managing a simple list of tasks stored persistently in a text file.

## ✨ Features

* **Task Persistence:** Tasks are saved to a file (`tasks.txt`) and persist between application runs.
* **Load Tasks:** Display all currently saved tasks.
* **Create Task:** Add a new task to the list.
* **Delete Task:** Remove a specific task from the list.
* **Clear All Tasks:** Delete all tasks and empty the file.

## 🛠️ Prerequisites

* [Dart SDK](https://dart.dev/get-dart) installed on your system.

## ⚙️ How to Run

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/oreskovs/Dart-Flutter-Projects/tree/main]
    cd Simple-Dart-ToDo-CLI
    ```

2.  **Execute the main file:**
    ```bash
    dart main.dart
    ```

## 📂 Project Structure

The application is split into two main files:

* `main.dart`: The entry point of the application, demonstrating how to use the `ToDoApp` class by creating, loading, and deleting tasks.
* `ToDoApp.dart`: Contains the core logic for task management, handling file operations (reading and writing to `tasks.txt`).

### `main.dart` Workflow

The `main.dart` file executes a demonstration sequence of operations:

1.  Initializes `ToDoApp`.
2.  Loads existing tasks.
3.  Creates "Go to gym".
4.  Loads tasks again (should show "Go to gym").
5.  Deletes "Go to gym".
6.  Creates three new tasks ("Buy groceries", "Learn to code", "Clear the room").
7.  Loads tasks (should show the three new tasks).
8.  Clears all tasks.

## 核心 Core Implementation (`ToDoApp.dart`)

The `ToDoApp` class uses the `dart:io` library for file management.

| Method | Description | Implementation Detail |
| :--- | :--- | :--- |
| `loadTasks()` | Reads and prints all tasks from `tasks.txt`. | Uses `file.readAsLines()` to get tasks as a `List<String>`. |
| `createTask()` | Adds a new task. | Uses `file.writeAsString(task + '\n', mode: FileMode.append)` to append to the file. |
| `deleteTask()` | Removes a specific task. | Reads all lines, removes the matching line from the list, and then **overwrites** the entire file using `file.writeAsString(lines.join('\n'))`. |
| `clearTasks()` | Deletes all tasks. | Overwrites the file with an empty string (`file.writeAsString('')`). |

---

## ✍️ Author

[Stojance Oreskov/oreskovs]