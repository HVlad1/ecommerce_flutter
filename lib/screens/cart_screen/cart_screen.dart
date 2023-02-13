import 'package:ecommerce_flutter/blocs/wishlist/cart/cart_bloc.dart';
import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                                child: const Text('Add more Items'))
                          ],
                        ),
                      SizedBox(child: ListView.builder(
                        itemCount: state.cart.products.length,
                        scrollDirection: Axis.vertical,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('SUBTOTAL',
                                  style: AppThemeData()
                                      .appThemeData
                                      .textTheme
                                      .headline5),
                              Text('\$${state.cart.subtotalString}'),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('DELIVERY FEE',
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
                          height: 60,
                          decoration: BoxDecoration(
                              color: CustomColors.primary.withAlpha(50)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          margin: const EdgeInsets.all(5.0),
                          decoration:
                              const BoxDecoration(color: CustomColors.primary),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('TOTAL',
                                    style: AppThemeData()
                                        .appThemeData
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white)),
                                Text('\$${state.cart.totalString}',
                                    style: AppThemeData()
                                        .appThemeData
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white)),
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
          return const Text('Something went wrong');
        }
      },
    ));
  }
}
