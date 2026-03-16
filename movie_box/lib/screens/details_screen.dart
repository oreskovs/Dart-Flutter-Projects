import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/models/movie.dart';
import 'package:movie_box/providers/movie_provider.dart';
import 'package:movie_box/services/movie_api_service.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiService = MovieApiService();
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.any((m) => m.imdbID == movie.imdbID);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(movie.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoritesProvider.notifier).toggleFavorite(movie);
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: isFavorite ? Colors.red : null,
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.fetchMovieDetails(movie.imdbID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Some error occured: ${snapshot.error}'));
          }

          final movie = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    movie['Poster'] != 'N/A'
                        ? movie['Poster']
                        : 'https://via.placeholder.com/300',
                    height: 300,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[850],
                        height: 300,
                        width: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.movie_filter,
                              color: Colors.white24,
                              size: 60,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'No Poster Available',
                              style: TextStyle(color: Colors.white24),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  movie['Title'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('⭐ ${movie['imdbRating']} | 📅 ${movie['Released']}'),
                const Divider(height: 30),
                const Text(
                  'Plot:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(movie['Plot'] ?? 'No Plot Available'),
                const SizedBox(height: 20),
                Text('Actors: ${movie['Actors']}'),
                Text('Director: ${movie['Director']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
