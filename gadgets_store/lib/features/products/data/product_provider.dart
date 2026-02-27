import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'product_repository.dart';
import '../domain/product.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productsProvider = Provider<List<Product>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getMockProducts();
});

final selectedCategoryProvider = StateProvider<String>((ref) => 'All');

final filteredProductsProvider = Provider<List<Product>>((ref) {
  final allProducts = ref.watch(productsProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);

  if (selectedCategory == 'All') {
    return allProducts;
  }
  return allProducts.where((p) => p.category == selectedCategory).toList();
});
