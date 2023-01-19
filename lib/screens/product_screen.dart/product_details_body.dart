import 'package:ecommerce_flutter/methods.dart';
import 'package:ecommerce_flutter/screens/product_screen.dart/product_details_container.dart';
import 'package:ecommerce_flutter/screens/product_screen.dart/product_details_price.dart';
import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../spacing.dart';
import '../../themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Spacings.paddingSliverToBoxAdapter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.modelProductDetails.productName,
              style: AppThemeData().appThemeData.textTheme.headline4,
            ),
            const SizedBox(
              height: Spacings.heightSizedBoxProductDetailsTitle,
            ),
            ProductPrice(product: product),
            const SizedBox(
              height: Spacings.heightSizedBoxProductDetais,
            ),
            ProductDetailsContainer(
              product: product,
              detailsName: AppLocalizations.of(context)!.materials,
              detailsProduct: product.modelProductDetails.material,
            ),
            const SizedBox(
              height: Spacings.heightSizedBoxProductDetais,
            ),
            ProductDetailsContainer(
                product: product,
                detailsName: AppLocalizations.of(context)!.colors,
                detailsProduct: product.modelProductDetails.color.capitalize()),
            const SizedBox(
              height: Spacings.heightSizedBoxProductDetais,
            ),
            ProductDetailsContainer(
                product: product,
                detailsName: AppLocalizations.of(context)!.department,
                detailsProduct: product.modelProductDetails.department),
            const SizedBox(
              height: Spacings.heightSizedBoxProductDetais,
            ),
          ],
        ),
      ),
    );
  }
}
