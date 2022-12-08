import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: Spacings.heightProductCard.toDouble(),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 65,
          left: 5,
          child: Container(
            width: screenWidth * 0.5 - 10,
            height: Spacings.heightBlackLineThroughProductCard.toDouble(),
            decoration: const BoxDecoration(
              color: CustomColors.primary,
            ),
            child: Padding(
              padding: Spacings.paddingBlackLineContent,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: AppThemeData().appThemeData.textTheme.bodyText1,
                        ),
                        Text(
                          '\$${product.price}',
                          style:
                              AppThemeData().appThemeData.textTheme.bodyText2,
                        )
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
        ),
      ],
    );
  }
}
