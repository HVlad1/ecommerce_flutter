import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/models/product_image_model.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';

class ProductCard extends StatelessWidget {
  final ModelProductImg product;
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
              decoration: const BoxDecoration(
                color: CustomColors.primary,
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
                            product.author,
                            style:
                                AppThemeData().appThemeData.textTheme.bodyText1,
                          ),
                          Text(
                            product.id,
                            style:
                                AppThemeData().appThemeData.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
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
