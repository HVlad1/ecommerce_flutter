import 'package:flutter/material.dart';


abstract class Spacings {
  //Custom App Bar
  static const paddingCustomAppBar = EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0);

  //Section title
  static const paddingSectionTitle = EdgeInsets.symmetric(horizontal: 20.0);

  //Product card
  static const heightProductCard = 150.0;
  static const heightBlackLineThroughProductCard = 85.0;
  static const paddingBlackLineContent = EdgeInsets.all(6.0);

  //Product Carousel
  static const heightProductCarousel = 165.0;
  static const paddingProductCarousel = EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  static const paddingBetweenCarouselCards  = EdgeInsets.only(right: 5.0);
}