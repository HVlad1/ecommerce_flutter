import 'package:ecommerce_flutter/blocs/wishlist/cart/cart_bloc.dart';
import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'cart_product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          return Padding(
            padding:
                Spacings.paddingCartScreen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.cart.freeDeliveryString,
                              style:
                                  AppThemeData().appThemeData.textTheme.headline5,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child:  Text(AppLocalizations.of(context)!.addMoreItems))
                          ],
                        ),
                      SizedBox(child: ListView.builder(
                        itemCount: state.cart.products.length,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>CartProductCard(product: state.cart.products[index],)),)
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Divider(thickness: 1, color: CustomColors.primary),
                    Padding(
                      padding: Spacings.paddingSubTotalCartScreen,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.subtotal,
                                  style: AppThemeData()
                                      .appThemeData
                                      .textTheme
                                      .headline5),
                              Text('\$${state.cart.subtotalString}'),
                            ],
                          ),
                           const SizedBox(
                            height: Spacings.heightSizedBoxCartScreen,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.deliveryFee,
                                  style: AppThemeData()
                                      .appThemeData
                                      .textTheme
                                      .headline5),
                              Text('\$${state.cart.deliveryFeeString}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: Spacings.heightTotalPriceCartScreen,
                          decoration: BoxDecoration(
                              color: CustomColors.primary.withAlpha(50)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: Spacings.heightTotalPriceCartScreenBlack,
                          margin: Spacings.marginTotalPriceContainer,
                          decoration:
                              const BoxDecoration(color: CustomColors.primary),
                          child: Padding(
                            padding:
                                Spacings.paddingTotalPriceContainer,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppLocalizations.of(context)!.total,
                                    style: AppThemeData()
                                        .appThemeData
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: CustomColors.secondary)),
                                Text('\$${state.cart.totalString}',
                                    style: AppThemeData()
                                        .appThemeData
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: CustomColors.secondary)),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return  Text(AppLocalizations.of(context)!.error);
        }
      },
    ));
  }
}
