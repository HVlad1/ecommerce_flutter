import 'package:ecommerce_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      elevation: 4,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => context.go('/'),
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => context.go('/category'),
              icon: const Icon(
                Icons.category_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => context.go('/cart'),
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            IconButton(
               onPressed: () => context.go('/favorite'),
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            IconButton(
               onPressed: () => context.go('/profile'),
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
