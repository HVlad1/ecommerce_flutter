import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';
import '../../models/product_model.dart';
import '../../themes.dart';

class ProductDetailsContainer extends StatelessWidget {
  final String detailsName;
  final String detailsProduct;
  const ProductDetailsContainer({
    Key? key,
    required this.product,
    required this.detailsName,
    required this.detailsProduct
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              detailsName,
              style: AppThemeData().appThemeData.textTheme.headline4,
            ),
            const SizedBox(
              height: 5,
            ),
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: Radius.radiusProductCard),
            child: Padding(
              padding: Spacings.paddingDetailsPromoCode,
              child: Text(
                detailsProduct,
              ),
            )),
      ],
    );
  }
}
