import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: Radius.radiusProductCard,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: Spacings.heightProductCard,
            child: Image.network(
              product.downloadUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            child: Container(
              width: screenWidth * 0.5 - 15,
              height: Spacings.heightBlackLineThroughProductCard,
              decoration: BoxDecoration(
                color: CustomColors.primary.withOpacity(0.4),
              ),
              child: Padding(
                padding: Spacings.paddingBlackLineContent,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.modelProductDetails.productName.length > 15
                                ? '${product.modelProductDetails.productName.substring(0, 15)}...'
                                : product.modelProductDetails.productName,
                            style:
                                AppThemeData().appThemeData.textTheme.bodyText1,
                          ),
                          Text(
                            '${product.modelProductDetails.priceString}\$',
                            style:
                                AppThemeData().appThemeData.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle,
                            color: CustomColors.onPrimary,
                          )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
