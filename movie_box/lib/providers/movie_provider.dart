import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../services/movie_api_service.dart';
import '../models/movie.dart';

final movieApiProvider = Provider((ref) => MovieApiService());

final searchQueryProvider = StateProvider<String>((ref) => 'Harry Potter');

final movieProvider = FutureProvider<List<Movie>>((ref) async {
  final apiService = ref.watch(movieApiProvider);
  final query = ref.watch(searchQueryProvider);

  if (query.isEmpty) return [];

  return apiService.searchMovies(query);
});

class FavoritesNotifier extends StateNotifier<List<Movie>> {
  FavoritesNotifier() : super([]);

  void toggleFavorite(Movie movie) {
    final isFavorite = state.any((item) => item.imdbID == movie.imdbID);

    if (isFavorite) {
      state = state.where((item) => item.imdbID != movie.imdbID).toList();
    } else {
      state = [...state, movie];
    }
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List>(
  (ref) => FavoritesNotifier(),
);
