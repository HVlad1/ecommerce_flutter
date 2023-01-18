
import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/screens/main_screen/custom_bottom_navigation_item.dart';
import 'package:ecommerce_flutter/screens/screens.dart';
import 'package:ecommerce_flutter/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../../components/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar:  CustomAppBar(title: AppLocalizations.of(context)!.appname),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: CustomColors.background,
          selectedItemColor: CustomColors.selectedItemColor,
          unselectedItemColor: CustomColors.unselectedItemColor,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          items:  [
            customNavigationItem(NavigationItemType.home, context),
            customNavigationItem(NavigationItemType.category, context),
            customNavigationItem(NavigationItemType.cart, context),
            customNavigationItem(NavigationItemType.favorite, context),
            customNavigationItem(NavigationItemType.profile, context),
           
          ]),
     
    );
  }
}
