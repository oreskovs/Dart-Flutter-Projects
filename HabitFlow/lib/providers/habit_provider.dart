import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:habit_tracker/data/local_storage_service.dart';
import 'package:habit_tracker/domain/models/habit.dart';

final localStorageServiceProvider = Provider((ref) => LocalStorageService());

final habitProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  final service = ref.watch(localStorageServiceProvider);
  return HabitNotifier(service);
});

class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier(this._serivce) : super([]) {
    _loadInitialHabits();
  }

  final LocalStorageService _serivce;

  Future<void> _loadInitialHabits() async {
    final habits = await _serivce.loadHabits();
    state = habits;
  }

  void addHabit(String name) {
    final newHabit = Habit(
      id: DateTime.now().toString(),
      name: name,
      isCompleted: false,
      date: DateTime.now(),
    );

    state = [...state, newHabit];
    _serivce.saveHabits(state);
  }

  void toggleHabit(String id) {
    state = [
      for (final habit in state)
        if (habit.id == id)
          habit.copyWith(isCompleted: !habit.isCompleted)
        else
          habit,
    ];
    _serivce.saveHabits(state);
  }

  void deleteHabit(String id) {
    state = state.where((habit) => habit.id != id).toList();
    _serivce.saveHabits(state);
  }

  void updateHabit(String id, String newName) {
    state = [
      for (final habit in state)
        if (habit.id == id) habit.copyWith(name: newName) else habit,
    ];
    _serivce.saveHabits(state);
  }
}
