import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/screens/product_screen.dart/product_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';

import '../colors.dart';
import '../spacing.dart';
import '../themes.dart';

class ProductCardBig extends StatelessWidget {
  final ProductModel product;
  const ProductCardBig({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(product: product))),
      child: Padding(
        padding: Spacings.paddingProductCardBig,
        child: ClipRRect(
          borderRadius: Radius.radiusProductCard,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: Spacings.heightProductCard,
                child: Image.network(product.downloadUrl,
                    fit: BoxFit.cover, width: Spacings.widthProductCardImage),
              ),
              Positioned(
                top: Spacings.alignBlackLineTop,
                right: 0,
                child: Container(
                  width: screenWidth * 0.97,
                  height: Spacings.heightBlackLineThroughProductCard,
                  decoration: BoxDecoration(
                    color: CustomColors.primary.withOpacity(0.4),
                  ),
                  child: Padding(
                    padding: Spacings.paddingBlackLineContent,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: Spacings.paddingProductCardBig,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.modelProductDetails.productName,
                                  style: AppThemeData()
                                      .appThemeData
                                      .textTheme
                                      .bodyText1,
                                ),
                                Text(
                                  '${product.modelProductDetails.priceString}\$',
                                  style: AppThemeData()
                                      .appThemeData
                                      .textTheme
                                      .bodyText1,
                                ),
                              ],
                            ),
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
        ),
      ),
    );
  }
}
