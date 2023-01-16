import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';

import '../../cubit/products_cubit.dart';
import '../product_screen.dart/product_details.dart';

class MostPopularCarousel extends StatelessWidget {
  final ProductsState productsState;
  const MostPopularCarousel({Key? key, required this.productsState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: (productsState as ProductsLoaded)
          .products
          .map((model) {
            return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: Radius.radiusContaierProducts,
                ),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(product: model))),
                    child: ProductCard(product: model)));
          })
          .toList()
          .sublist(14, 19),
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
