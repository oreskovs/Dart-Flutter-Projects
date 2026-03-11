import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/models/habit.dart';

class LocalStorageService {
  static const String _key = 'habits_list';
  static const String _themeKey = 'is_dark_mode';

  Future<void> saveHabits(List<Habit> habits) async {
    final prefs = await SharedPreferences.getInstance();

    final List<Map<String, dynamic>> habitsMap = habits
        .map((habit) => habit.toMap())
        .toList();

    final String encodedData = jsonEncode(habitsMap);
    await prefs.setString(_key, encodedData);
  }

  Future<List<Habit>> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString(_key);

    if (encodedData == null) return [];

    final List<dynamic> data = jsonDecode(encodedData);

    return data.map((habit) => Habit.fromJson(habit)).toList();
  }

  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }
}
