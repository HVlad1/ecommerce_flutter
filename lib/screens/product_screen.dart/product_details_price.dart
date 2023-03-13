import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';
import '../../colors.dart';
import '../../models/product_model.dart';
import '../../themes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Radius.radiusProductCard,
      ),
      child: Row(
        children: [
          Padding(
            padding: Spacings.paddingDetailsPrice,
            child: Text(
              '${product.modelProductDetails.priceString}\$',
              style: AppThemeData().appThemeData.textTheme.displayMedium,
            ),
          ),
          Column(
            children: [
              Text(AppLocalizations.of(context)!.promoCode,
                  style:
                      AppThemeData().appThemeData.textTheme.displaySmall),
              Container(
                  decoration: BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: Radius.radiusProductCard),
                  child: Padding(
                    padding: Spacings.paddingDetailsPromoCode,
                    child: Text(product.modelProductDetails.promoCode,
                        style: AppThemeData()
                            .appThemeData
                            .textTheme
                            .bodyLarge),
                  )),
            ],
          )
        ],
      ),
    );
  }
}