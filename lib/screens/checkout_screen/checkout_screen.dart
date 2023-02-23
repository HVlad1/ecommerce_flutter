import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/components/widgets.dart';
import 'package:ecommerce_flutter/screens/cart_screen/order_summary.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/wishlist/checkout/bloc/checkout_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondary,
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.checkout),
      floatingActionButton: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoaded) {
            return FloatingActionButton(
                onPressed: () {
                  context
                      .read<CheckoutBloc>()
                      .add(ConfirmCheckout(checkout: state.checkout));
                },
                backgroundColor: CustomColors.primary,
                child: const Icon(
                  Icons.euro,
                  color: CustomColors.secondary,
                ));
          } else {
            return const SizedBox();
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.customerInformation,
                    style: AppThemeData().appThemeData.textTheme.headline5,
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  }, context, AppLocalizations.of(context)!.checkoutEmail),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  }, context, AppLocalizations.of(context)!.checkoutFullName),
                  Text(
                    AppLocalizations.of(context)!.deliveryInformation,
                    style: AppThemeData().appThemeData.textTheme.headline5,
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  }, context, AppLocalizations.of(context)!.address),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  }, context, AppLocalizations.of(context)!.city),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  }, context, AppLocalizations.of(context)!.country),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  }, context, AppLocalizations.of(context)!.zipCode),
                  Text(
                    AppLocalizations.of(context)!.orderSummary,
                    style: AppThemeData().appThemeData.textTheme.headline5,
                  ),
                  const OrderSummary(),
                ],
              );
            } else {
              return  Text(AppLocalizations.of(context)!.error);
            }
          },
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(labelText),
          ),
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
          ))
        ],
      ),
    );
  }
}
