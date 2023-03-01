import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/components/widgets.dart';
import 'package:ecommerce_flutter/screens/cart_screen/order_summary.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/wishlist/checkout/bloc/checkout_bloc.dart';
import '../../validators.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColors.secondary,
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.checkout),
      floatingActionButton: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoaded) {
            return FloatingActionButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<CheckoutBloc>()
                        .add(ConfirmCheckout(checkout: state.checkout));
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Icon(Icons.check_circle_outline),
                        content:
                            Text(AppLocalizations.of(context)!.orderConfirmed),
                        actions: [
                          CupertinoDialogAction(
                            child: Text(
                                AppLocalizations.of(context)!.continueShopping),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    );
                  } else {
                    const SizedBox();
                  }
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: Spacings.paddingCheckoutScreen,
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state is CheckoutLoading) {
                  return const SizedBox();
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
                      }, context, AppLocalizations.of(context)!.checkoutEmail,
                          emailValidator),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(fullName: value));
                      },
                          context,
                          AppLocalizations.of(context)!.checkoutFullName,
                          fullNameValidator),
                      Text(
                        AppLocalizations.of(context)!.deliveryInformation,
                        style: AppThemeData().appThemeData.textTheme.headline5,
                      ),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(address: value));
                      }, context, AppLocalizations.of(context)!.address,
                          addressValidator),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(city: value));
                      }, context, AppLocalizations.of(context)!.city,
                          cityValidator),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(country: value));
                      }, context, AppLocalizations.of(context)!.country,
                          countryValidator),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(zipCode: value));
                      }, context, AppLocalizations.of(context)!.zipCode,
                          zipCodeValidator),
                      Text(
                        AppLocalizations.of(context)!.orderSummary,
                        style: AppThemeData().appThemeData.textTheme.headline5,
                      ),
                      const OrderSummary(),
                    ],
                  );
                } else {
                  return Text(AppLocalizations.of(context)!.error);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildTextFormField(Function(String)? onChanged, BuildContext context,
      String labelText, String? Function(String?)? validator) {
    return Padding(
      padding: Spacings.paddingCheckoutFormField,
      child: Row(
        children: [
          SizedBox(
            width: Spacings.widthSizedBoxFormField,
            child: Text(labelText),
          ),
          Expanded(
              child: TextFormField(
            validator: validator,
            onChanged: onChanged,
          ))
        ],
      ),
    );
  }
}
