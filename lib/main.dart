import 'package:ecommerce_flutter/api/product_details_api.dart';
import 'package:ecommerce_flutter/api/product_image_api.dart';
import 'package:ecommerce_flutter/blocs/wishlist/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_flutter/blocs/wishlist/cart/cart_bloc.dart';
import 'package:ecommerce_flutter/cubit/products_cubit.dart';
import 'package:ecommerce_flutter/l10n/l10n.dart';
import 'package:ecommerce_flutter/repo/checkout/checkout_repository.dart';
import 'package:ecommerce_flutter/router/router.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/wishlist/checkout/bloc/checkout_bloc.dart';
import 'blocs/wishlist/wishlist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (_) => CartBloc()..add(LoadCartList())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository()))
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
