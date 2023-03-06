import 'package:ecommerce_flutter/screens/login_screen/auth_page.dart';
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
      builder: (context, state) =>   LoginScreen(onTap: () {  },),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) =>  RegisterScreen(onTap: () {  },),
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
      path: '/authPage',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    )
  ],
);
