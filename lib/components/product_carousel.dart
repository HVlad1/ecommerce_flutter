import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Spacings.heightProductCarousel.toDouble(),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: Spacings.paddingProductCarousel,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: Spacings.paddingBetweenCarouselCards,
            child: ProductCard(product: products[index],),
          );
        },
      ),
    );
  }
}