import 'package:flutter/material.dart';


abstract class Spacings {
  //Custom App Bar
  static const paddingCustomAppBar = EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0);

  //Section title
  static const paddingSectionTitle = EdgeInsets.symmetric(horizontal: 20.0);

  //Product card
  static const heightProductCard = 150;
  static const heightBlackLineThroughProductCard = 65;
  static const paddingBlackLineContent = EdgeInsets.all(2.0);

  //Product Carousel
  static const heightProductCarousel = 165;
  static const paddingProductCarousel = EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  static const paddingBetweenCarouselCards  = EdgeInsets.only(right: 5.0);
}