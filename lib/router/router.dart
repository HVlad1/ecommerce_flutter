import 'package:ecommerce_flutter/screens/login_screen/screen_controller.dart';
import 'package:ecommerce_flutter/screens/screens.dart';
import 'package:ecommerce_flutter/screens/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/register_screen/register_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/category',
      builder: (context, state) => const CategoryScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => const FavoriteScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/screenController',
      builder: (context, state) => const ScreenController(),
    )
  ],
);
