import 'package:ecommerce_flutter/api/product_details_api.dart';
import 'package:ecommerce_flutter/api/product_image_api.dart';
import 'package:ecommerce_flutter/blocs/wishlist/cart/cart_bloc.dart';
import 'package:ecommerce_flutter/cubit/products_cubit.dart';
import 'package:ecommerce_flutter/l10n/l10n.dart';
import 'package:ecommerce_flutter/router/router.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/wishlist/wishlist_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(
              ProductImageDataService(), ProductDetailsDataService())
            ..getProducts(),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCartList())),
      ],
      child: MaterialApp.router(
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        title: 'Go Router',
        theme: AppThemeData().appThemeData,
        routerConfig: router,
      ),
    );
  }
}
