import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/components/carousel_card.dart';
import 'package:flutter/material.dart';

import '../../cubit/products_cubit.dart';

class SliderCarousel extends StatelessWidget {
  final ProductsState productState;
  const SliderCarousel({Key? key, required this.productState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: (productState as ProductsLoaded)
          .products
          .map((model) {
            return CarouselCard(product: model);
          })
          .toList()
          .sublist(0, 10),
      options: CarouselOptions(
        aspectRatio: 1.6,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enableInfiniteScroll: true,
        initialPage: 2,
        autoPlay: true,
      ),
    );
  }
}
