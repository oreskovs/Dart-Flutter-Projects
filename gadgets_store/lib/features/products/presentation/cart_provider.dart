import 'package:flutter_riverpod/legacy.dart';
import '../domain/cart_item.dart';
import '../../products/domain/product.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    final existingIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex >= 0) {
      state[existingIndex].quantity++;
      state = [...state];
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  void removeFromCart(String productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  double get totalPrice =>
      state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
