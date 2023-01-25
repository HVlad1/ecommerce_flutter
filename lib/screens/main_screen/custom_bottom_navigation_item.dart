import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum NavigationItemType { home, category, cart, favorite, profile }

customNavigationItem(NavigationItemType type, BuildContext context) {
  String label = '';
  Icon icon = const Icon(Icons.home);
  switch (type) {
    case NavigationItemType.home:
      label = AppLocalizations.of(context)!.home;
      icon = const Icon(Icons.home);
      break;

    case NavigationItemType.category:
      label = AppLocalizations.of(context)!.products;
      icon = const Icon(Icons.category_outlined);
      break;

    case NavigationItemType.cart:
      label = AppLocalizations.of(context)!.cart;
      icon = const Icon(Icons.shopping_cart);
      break;

    case NavigationItemType.favorite:
      label =  AppLocalizations.of(context)!.favorites;
      icon = const Icon(Icons.favorite);
      break;

    case NavigationItemType.profile:
      label = AppLocalizations.of(context)!.profile;
      icon = const Icon(Icons.person);
      break;
  }
  return BottomNavigationBarItem(icon: icon, label: label);
}
