import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/models/product_image_model.dart';
import 'package:ecommerce_flutter/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';

class RecommendedProducts extends StatelessWidget {
  final List<ModelProductImg> imgList;
  const RecommendedProducts({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imgList
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
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enableInfiniteScroll: false,
        initialPage: 1,
        autoPlay: false,
      ),
    );
  }
}
