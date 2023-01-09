import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';

import '../../cubit/products_cubit.dart';

class RecommendedCarousel extends StatelessWidget {
  final ProductsState productState;
  const RecommendedCarousel({Key? key, required this.productState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: (productState as ProductsLoaded)
          .products
          .map((model) {
            return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: Radius.radiusContaierProducts,
                ),
                child: ProductCard(product: model));
          })
          .toList()
          .sublist(10, 13),
      options: CarouselOptions(
        aspectRatio: 2.5,
        enlargeCenterPage: true,
        viewportFraction: 0.4,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enableInfiniteScroll: false,
        initialPage: 1,
        autoPlay: false,
      ),
    );
  }
}
