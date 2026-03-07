import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_t/src/features/data/cart_provider.dart';
import 'package:go_router/go_router.dart';
import '../../data/products_repository.dart';
import '../widgets/product_card.dart';

class ProductsListScreen extends ConsumerWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(fetchProductsProvider);
    final cartItems = ref.watch(cartProvider);
    final totalItems = cartItems.fold<int>(
      0,
      (sum, item) => sum + item.quantity,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Store Products'),
        actions: [
          IconButton(
            onPressed: () => context.push('/favorites'),
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
          Badge(
            label: Text('$totalItems'),
            isLabelVisible: totalItems > 0,
            child: IconButton(
              onPressed: () => context.push('/cart'),
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: productsAsync.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        ),
        error: (err, stack) => Center(child: Text('Some error occured $err')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
