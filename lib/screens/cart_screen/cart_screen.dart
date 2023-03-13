import 'package:ecommerce_flutter/blocs/wishlist/cart/cart_bloc.dart';
import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/screens/checkout_screen/checkout_screen.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'cart_product_card.dart';
import 'order_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          return Padding(
            padding: Spacings.paddingCartScreen,
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
                              style: AppThemeData()
                                  .appThemeData
                                  .textTheme
                                  .headlineSmall,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                    AppLocalizations.of(context)!.addMoreItems))
                          ],
                        ),
                        SizedBox(
                          child: ListView.builder(
                              itemCount: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .length,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Slidable(
                                    endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) {},
                                            backgroundColor: Colors.blueAccent,
                                            foregroundColor:
                                                CustomColors.secondary,
                                            icon: Icons.share,
                                            label: AppLocalizations.of(context)!
                                                .share,
                                          ),
                                          SlidableAction(
                                            onPressed: (context) {
                                              context.read<CartBloc>().add(
                                                  RemoveProductFromCartList(
                                                      state.cart
                                                          .products[index]));
                                            },
                                            backgroundColor: CustomColors.error,
                                            foregroundColor:
                                                CustomColors.secondary,
                                            icon: Icons.delete,
                                            label: AppLocalizations.of(context)!
                                                .delete,
                                          ),
                                        ]),
                                    child: CartProductCard(
                                        product: state.cart
                                            .productQuantity(
                                                state.cart.products)
                                            .keys
                                            .elementAt(index),
                                        quantity: state.cart
                                            .productQuantity(
                                                state.cart.products)
                                            .values
                                            .elementAt(index)),
                                  )),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckoutScreen())),
                    child: const OrderSummary()),
              ],
            ),
          );
        } else {
          return Text(AppLocalizations.of(context)!.error);
        }
      },
    ));
  }
}
