import 'package:flutter_t/src/features/domain/product.dart';
import 'package:flutter_t/src/features/presentation/screens/cart_screen.dart';
import 'package:flutter_t/src/features/presentation/screens/favorites_screen.dart';
import 'package:flutter_t/src/features/presentation/screens/product_detail_screen.dart';
import 'package:go_router/go_router.dart';
import '../features/presentation/screens/products_list_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ProductsListScreen(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) {
            return ProductDetailScreen(product: state.extra as Product);
          },
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesScreen(),
        ),
        GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
      ],
    ),
  ],
);
