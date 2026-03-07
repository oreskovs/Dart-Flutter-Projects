import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_t/src/features/presentation/widgets/error_message.dart';
import '../../data/products_repository.dart';
import '../../data/favorites_provider.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProductsAsync = ref.watch(fetchProductsProvider);
    final favoritesId = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: allProductsAsync.when(
        data: (allProducts) {
          final favoritesProds = allProducts
              .where((p) => favoritesId.contains(p.id))
              .toList();

          if (favoritesProds.isEmpty) {
            return const Center(
              child: Text('You don`t have favorite products'),
            );
          }

          return ListView.builder(
            itemCount: favoritesProds.length,
            itemBuilder: (context, index) =>
                ProductCard(product: favoritesProds[index]),
          );
        },
        error: (err, stack) => ErrorMessage(
          message: 'Some error occured $err',
          onRetry: () {
            ref.invalidate(fetchProductsProvider);
          },
        ),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}
