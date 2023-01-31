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

  //Product Details
  static const paddingSliverAppBar = EdgeInsets.all(5.0);
  static const heightSliverAppBar = 250.0;
  static const paddingSliverToBoxAdapter = EdgeInsets.only(top: 18.0, right: 16.0, left: 16.0);
  static const heightContainerDetails = 310.0;
  static const borderRadiusContainerDetails = BorderRadius.all(Radius.circular(29.0));
  static const paddingDetailsPrice = EdgeInsets.all(28.0);
  static const paddingDetailsPromoCode = EdgeInsets.all(10.0);
  static const heightSizedBoxProductDetais = 10.0;
  static const heightSizedBoxProductDetailsTitle = 15.0;

  //Category Card
  static const widthCategoryCard = 160.0;
  static const borderRadiusCategoryCard = BorderRadius.all(Radius.circular(20.0));
  static const heightCategoryCard = 140.0;
  static const paddingCategoryCardContent = EdgeInsets.only(left: 8.0, right: 8.0, top: 35.0);
  static const sizeIconCategoryCard = 50.0;
  static const heightSizedBoxCategoryCardContent = 10.0;
  static const heightSizedBoxCategoryScreen = 15.0;

  static const actionIconSize = 40.0;
  static const sliverAppBarHeight = 170.0;

  //Product Card Big
  static const paddingProductCardBig = EdgeInsets.all(8.0);
  static const widthProductCardImage = 1000.0;
  static const alignBlackLineTop = 70.0;
}