import 'ToDoApp.dart';

void main() async {
  ToDoApp toDoApp = ToDoApp();

  await toDoApp.loadTasks();

  await toDoApp.createTask("Go to gym");

  await toDoApp.loadTasks();

  await toDoApp.deleteTask("Go to gym");

  await toDoApp.createTask("Buy groceries");

  await toDoApp.createTask("Learn to code");

  await toDoApp.createTask("Clear the room");

  await toDoApp.loadTasks();

  await toDoApp.clearTasks();
}
