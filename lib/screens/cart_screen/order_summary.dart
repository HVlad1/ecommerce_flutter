import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../blocs/wishlist/cart/cart_bloc.dart';
import '../../colors.dart';
import '../../spacing.dart';
import '../../themes.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
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
                                .headlineSmall),
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
                                .headlineSmall),
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
                      padding: Spacings.paddingTotalPriceContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.total,
                              style: AppThemeData()
                                  .appThemeData
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: CustomColors.secondary)),
                          Text('\$${state.cart.totalString}',
                              style: AppThemeData()
                                  .appThemeData
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: CustomColors.secondary)),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        } else {
          return Text(AppLocalizations.of(context)!.error);
        }
      },
    );
  }
}
