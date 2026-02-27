import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gadgets_store/features/products/presentation/cart_screen.dart';
import 'package:gadgets_store/features/products/presentation/checkout_screen.dart';
import 'package:gadgets_store/features/products/presentation/contact_screen.dart';
import 'package:go_router/go_router.dart';
import 'core/app_theme.dart';
import 'features/products/presentation/home_screen.dart';
import 'features/products/presentation/login_screen.dart';
import 'features/products/presentation/signup_screen.dart';

void main() {
  runApp(const ProviderScope(child: GadgetStoreApp()));
}

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
  ],
);

class GadgetStoreApp extends StatelessWidget {
  const GadgetStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Gadget Store',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
