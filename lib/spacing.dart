import 'package:flutter/material.dart';

abstract class Spacings {
  //Custom App Bar
  static const paddingCustomAppBar =
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0);

  //Section title
  static const paddingSectionTitle = EdgeInsets.symmetric(horizontal: 20.0);

  //Product card
  static const heightProductCard = 150.0;
  static const heightBlackLineThroughProductCard = 85.0;
  static const paddingBlackLineContent = EdgeInsets.all(6.0);

  //Product Carousel
  static const heightProductCarousel = 165.0;
  static const paddingProductCarousel =
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  static const paddingBetweenCarouselCards = EdgeInsets.only(right: 5.0);

  //Product Details
  static const paddingSliverAppBar = EdgeInsets.all(5.0);
  static const heightSliverAppBar = 250.0;
  static const paddingSliverToBoxAdapter =
      EdgeInsets.only(top: 18.0, right: 16.0, left: 16.0);
  static const heightContainerDetails = 310.0;
  static const borderRadiusContainerDetails =
      BorderRadius.all(Radius.circular(29.0));
  static const paddingDetailsPrice = EdgeInsets.all(24.0);
  static const paddingDetailsPromoCode = EdgeInsets.all(10.0);
  static const heightSizedBoxProductDetais = 10.0;
  static const heightSizedBoxProductDetailsTitle = 15.0;

  //Category Card
  static const widthCategoryCard = 160.0;
  static const borderRadiusCategoryCard =
      BorderRadius.all(Radius.circular(20.0));
  static const heightCategoryCard = 140.0;
  static const paddingCategoryCardContent =
      EdgeInsets.only(left: 8.0, right: 8.0, top: 35.0);
  static const sizeIconCategoryCard = 50.0;
  static const heightSizedBoxCategoryCardContent = 10.0;
  static const heightSizedBoxCategoryScreen = 15.0;

  static const actionIconSize = 40.0;
  static const sliverAppBarHeight = 170.0;

  //Product Card Big
  static const paddingProductCardBig = EdgeInsets.all(8.0);
  static const widthProductCardImage = 1000.0;
  static const alignBlackLineTop = 70.0;

  //Category Details
  static const heightExpandedSliver = 200.0;
  static const shapeSliver = RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)));
  static const sizeIconBackground = 150.0;
  static const paddingCircularProgressIndicator = EdgeInsets.all(8.0);

  //Cart Screen
  static const paddingCartScreen = EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  static const paddingSubTotalCartScreen = EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0);
  static const heightSizedBoxCartScreen = 5.0;
  static const heightTotalPriceCartScreen = 60.0;
  static const heightTotalPriceCartScreenBlack= 50.0;
  static const marginTotalPriceContainer = EdgeInsets.all(5.0);
  static const paddingTotalPriceContainer = EdgeInsets.symmetric(horizontal: 20.0);
  static const paddingCartProductCard = EdgeInsets.only(top: 8.0);

  //Checkout Screen
  static const paddingCheckoutScreen = EdgeInsets.all(20.0);
  static const paddingCheckoutFormField = EdgeInsets.all(8.0);
  static const widthSizedBoxFormField = 75.0;

  //Login/Register Screen
  static const heightSizedBoxLogIn25 = 25.0;
  static const heightSizedBoxLogIn10 = 10.0;
  static const heightSizedBoxLogIn50 = 50.0;
  static const widthSizedBoxLogIn25 = 25.0;
  static const widthSizedBoxLogIn5 = 5.0;

  static const paddingTextField = EdgeInsets.symmetric(horizontal: 25.0);
  static const paddingForgotPassword = EdgeInsets.only(top: 10.0);

  static const paddingContainerSignInButton = EdgeInsets.all(25.0);
  static const marginContainerSignInButton = EdgeInsets.symmetric(horizontal: 25.0);
  static BorderRadius borderRadiusSignInButton = BorderRadius.circular(12.0);
  static const paddingAuthErrorLogin = EdgeInsets.only(top: 10.0);
  static const paddingLogInButton = EdgeInsets.only(top: 25.0);
  static const widthMaterialButtonLogIn = 250.0;
  static const heightMaterialButtonLogIn = 50.0;
  
  //Reset Password Screen
  static const heightTopContainerResetPassword = 5.0;
  static const widthTopContainerResetPassword = 50.0;
  static const paddingTopContainerResetPassword = EdgeInsets.symmetric(vertical: 5.0);
  static const generalPaddingResetPassword = EdgeInsets.only(left: 25, top: 25, bottom: 50);
  static const paddingTextFormFieldResetPassword = EdgeInsets.all(20.0);

  //Profile Screen
  static const heightSizedBoxHeader = 20.0;
  static const paddingProfileMenuContainer = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const borderProfileMenuContainer = BorderRadius.all(Radius.circular(20.0));
  static const paddingProfileMenuContainerContent = EdgeInsets.all(20.0);
  static BorderRadius borderRadiusExpansionTileHelp = BorderRadius.circular(20.0);
  static const paddingExpansionTileHelp = EdgeInsets.all(8.0);
  static BorderRadius borderRadiusModalHelp = BorderRadius.circular(20.0);
  static const paddingContentModal = EdgeInsets.all(14.0);
}

