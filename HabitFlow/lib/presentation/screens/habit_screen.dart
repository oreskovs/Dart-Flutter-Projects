import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/domain/models/habit.dart';
import 'package:habit_tracker/providers/habit_provider.dart';
import 'package:habit_tracker/providers/theme_provider.dart';

class HabitScreen extends ConsumerWidget {
  const HabitScreen({super.key});

  void _showAddHabitDialog(
    BuildContext context,
    WidgetRef ref, {
    Habit? habit,
  }) {
    final controller = TextEditingController(text: habit?.name ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(habit == null ? 'New Habit' : 'Edit Habit'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter habit name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                if (habit == null) {
                  ref.read(habitProvider.notifier).addHabit(controller.text);
                } else {
                  ref
                      .read(habitProvider.notifier)
                      .updateHabit(habit.id, controller.text);
                }
                Navigator.pop(context);
              }
            },
            child: Text(habit == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitProvider);
    final completedCount = habits.where((h) => h.isCompleted).length;
    final totalCount = habits.length;
    final double progress = totalCount == 0 ? 0 : completedCount / totalCount;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Habits Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: Icon(
              ref.watch(themeProvider) ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          if (totalCount > 0)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Colors.grey[300],
                    color: progress == 1.0 ? Colors.green : Colors.blue,
                  ),
                  const SizedBox(height: 8),
                  Text('Completed: $completedCount / $totalCount'),
                ],
              ),
            ),

          Expanded(
            child: habits.isEmpty
                ? const Center(child: Text('You have no habits. Add one!'))
                : ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      final habit = habits[index];
                      return ListTile(
                        onLongPress: () =>
                            _showAddHabitDialog(context, ref, habit: habit),
                        leading: IconButton(
                          onPressed: () => ref
                              .read(habitProvider.notifier)
                              .toggleHabit(habit.id),
                          icon: Icon(
                            habit.isCompleted
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: habit.isCompleted ? Colors.green : null,
                          ),
                        ),
                        title: Text(
                          habit.name,
                          style: TextStyle(
                            decoration: habit.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => ref
                              .read(habitProvider.notifier)
                              .deleteHabit(habit.id),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddHabitDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }
}
