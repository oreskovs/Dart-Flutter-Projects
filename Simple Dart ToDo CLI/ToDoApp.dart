import 'dart:io';

class ToDoApp {
  File file = File('tasks.txt');

  Future<void> loadTasks() async {
    if (await file.exists()) {
      var lines = await file.readAsLines();
      print('Current Tasks:');
      if (lines.length < 1) print('You do not have tasks');
      for (var line in lines) {
        print("- $line");
      }
    }
  }

  Future<void> createTask(String task) async {
    await file.writeAsString("$task\n", mode: FileMode.append);
    print('Task created successfully');
  }

  Future<void> clearTasks() async {
    await file.writeAsString('');
    print('All tasks deleted');
  }

  Future<void> deleteTask(String task) async {
    var lines = await file.readAsLines();
    if (lines.length < 1) {
      print('You do not have tasks to remove');
      return;
    }

    if (lines.contains(task)) {
      lines.remove(task);
      await file.writeAsString(lines.join('\n'));
      print('$task task removed successfully');
    }
  }
}
