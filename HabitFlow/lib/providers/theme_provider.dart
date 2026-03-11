import 'package:flutter_riverpod/legacy.dart';
import 'package:habit_tracker/data/local_storage_service.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    _loadTheme();
  }

  final _service = LocalStorageService();

  Future<void> _loadTheme() async {
    state = await _service.loadTheme();
  }

  void toggleTheme() {
    state = !state;
    _service.saveTheme(state);
  }
}
