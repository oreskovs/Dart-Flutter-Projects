import 'package:flutter_t/src/features/utils/shared_prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

@riverpod
class Favorites extends _$Favorites {
  static const _key = 'favorite_ids';

  @override
  List<int> build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final savedIds = prefs.getStringList(_key) ?? [];
    return savedIds.map(int.parse).toList();
  }

  void toggle(int productId) {
    final prefs = ref.read(sharedPreferencesProvider);

    if (state.contains(productId)) {
      state = state.where((id) => id != productId).toList();
    } else {
      state = [...state, productId];
    }

    final stringIds = state.map((id) => id.toString()).toList();
    prefs.setStringList(_key, stringIds);
  }
}
