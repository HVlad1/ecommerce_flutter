import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/models/product_image_model.dart';
import 'package:ecommerce_flutter/components/carousel_card.dart';
import 'package:flutter/material.dart';

Widget imageCarousel(List<ModelProductImg> imgList) {
  return CarouselSlider(
    items: imgList
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
