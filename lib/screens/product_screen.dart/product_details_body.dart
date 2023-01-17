import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../spacing.dart';
import '../../themes.dart';

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
          children: [
            Row(
              children: [
                Text(
                  product.modelProductDetails.productName,
                  style: AppThemeData().appThemeData.textTheme.headline4,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: Spacings.heightContainerDetails,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: Spacings.borderRadiusContainerDetails),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExpansionTile(
                      title: const Text('Name'),
                      children: [
                        ListTile(
                          title: Text(product.modelProductDetails.productName),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('Price'),
                      children: [
                        ListTile(
                          title: Text(
                              '${product.modelProductDetails.priceString}\$'),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('Material'),
                      children: [
                        ListTile(
                          title: Text(product.modelProductDetails.material),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('Color'),
                      children: [
                        ListTile(
                          title: Text(product.modelProductDetails.color),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('Promo Code'),
                      children: [
                        ListTile(
                          title: Text(product.modelProductDetails.promoCode),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
