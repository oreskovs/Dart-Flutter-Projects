import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_box/screens/details_screen.dart';
import 'package:movie_box/screens/favorites_screen.dart';
import '../providers/movie_provider.dart';

class MovieHomeScreen extends ConsumerWidget {
  const MovieHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsync = ref.watch(movieProvider);
    final searchController = TextEditingController(
      text: ref.watch(searchQueryProvider),
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final query = searchController.text.trim();
              if (query.isNotEmpty) {
                ref.read(searchQueryProvider.notifier).state = query;
                FocusScope.of(context).unfocus();
              }
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => FavoritesScreen()),
              );
            },
            icon: const Icon(Icons.favorite, color: Colors.white),
          ),
        ],
        title: TextField(
          controller: searchController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search Movies',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            ref.read(searchQueryProvider.notifier).state = value;
          },
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: moviesAsync.when(
        data: (movies) => movies.isEmpty
            ? const Center(child: Text('No movies found!'))
            : ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(movie: movie),
                          ),
                        );
                      },
                      leading: SizedBox(
                        width: 50,
                        height: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(4),
                          child: Image.network(
                            movie.poster,
                            width: 50,
                            height: 75,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.white54,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const CircularProgressIndicator(
                                strokeWidth: 2,
                              );
                            },
                          ),
                        ),
                      ),
                      title: Text(
                        movie.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${movie.year} • ${movie.type.toUpperCase()}',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
        error: (err, stack) => Center(child: Text('Some error occured: $err')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
