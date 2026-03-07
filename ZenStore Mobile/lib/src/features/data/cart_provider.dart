import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/cart_item.dart';
import '../domain/product.dart';

part 'cart_provider.g.dart';

@Riverpod(keepAlive: true)
class Cart extends _$Cart {
  @override
  List<CartItem> build() {
    return [];
  }

  void addToCart(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            state[i].copyWith(quantity: state[i].quantity + 1)
          else
            state[i],
      ];
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  void removeFromCart(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  double get totalAmount {
    return state.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void updateQuantity(int productId, int delta) {
    final index = state.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      final newQuantity = state[index].quantity + delta;

      if (newQuantity <= 0) {
        removeFromCart(productId);
      } else {
        final newList = List<CartItem>.from(state);
        newList[index] = newList[index].copyWith(quantity: newQuantity);
        state = newList;
      }
    }
  }

  void clearCart() {
    state = [];
  }
}
