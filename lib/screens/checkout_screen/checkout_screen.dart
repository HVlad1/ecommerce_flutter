import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/components/widgets.dart';
import 'package:ecommerce_flutter/screens/cart_screen/order_summary.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColors.secondary,
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.checkout),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.customerInformation,
              style: AppThemeData().appThemeData.textTheme.headline5,
            ),
            _buildTextFormField(emailController, context,
                AppLocalizations.of(context)!.checkoutEmail),
            _buildTextFormField(nameController, context,
                AppLocalizations.of(context)!.checkoutFullName),
            Text(
              AppLocalizations.of(context)!.deliveryInformation,
              style: AppThemeData().appThemeData.textTheme.headline5,
            ),
            _buildTextFormField(addressController, context,
                AppLocalizations.of(context)!.address),
            _buildTextFormField(
                cityController, context, AppLocalizations.of(context)!.city),
            _buildTextFormField(countryController, context,
                AppLocalizations.of(context)!.country),
            _buildTextFormField(zipCodeController, context,
                AppLocalizations.of(context)!.zipCode),
            Text(
              AppLocalizations.of(context)!.orderSummary,
              style: AppThemeData().appThemeData.textTheme.headline5,
            ),
            const OrderSummary(),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
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
            controller: controller,
          ))
        ],
      ),
    );
  }
}
