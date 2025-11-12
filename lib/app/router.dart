import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juice_time_menu/features/home/presentation/views/home_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),

    // GoRoute(
    //   path: '/products',
    //   name: 'products',
    //   builder: (context, state) => const ProductListScreen(),
    // ),
    // GoRoute(
    //   path: '/categories',
    //   name: 'categories',
    //   builder: (context, state) => const CategoryListScreen(),
    // ),
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('صفحة غير موجودة: ${state.error}'))),
);
