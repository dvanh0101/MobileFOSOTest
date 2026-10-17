import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/cart/presentation/cart_screen.dart';
import '../../features/category/presentation/category_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/main/presentation/main_shell.dart';
import '../../features/news/presentation/news_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const home = '/home';
  static const cart = '/cart';
  static const category = '/category';
  static const news = '/news';
  static const profile = '/profile';
}

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,

    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.home,
              name: 'Trang chủ',
              builder: (context, state) => const HomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.cart,
              name: 'cart',
              builder: (context, state) => const CartScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.category,
              name: 'category',
              builder: (context, state) => const CategoryScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.news,
              name: 'news',
              builder: (context, state) => const NewsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.profile,
              name: 'profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ]),
        ],
      ),
    ],

    // Trang lỗi khi vào route không tồn tại
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Lỗi')),
      body: Center(child: Text('Không tìm thấy trang: ${state.uri}')),
    ),
  );
}