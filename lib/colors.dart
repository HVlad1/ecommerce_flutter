import 'package:flutter/material.dart';

abstract class CustomColors {
  //Texts color
  static const textColorOnCard = Color.fromARGB(255, 247, 247, 247);
  static const textColorOnWhite = Color.fromARGB(255, 0, 0, 0);

  static const transparent = Colors.transparent;

  static const primary = Color.fromARGB(255, 0, 0, 0);

  static const onPrimary = Color(0xFFFFFFFF);

  static const surface = Color(0xFFeef0eb);

  static const onSurface = primary;
  static const secondary = Color(0xFFFFFFFF);

  static const error = Color(0xFFD73A44);
  static const onError = Color(0xFFFFFFFF);

  static const unused = Color(0xFFFFFFFF);

  //Background
  static const background = Color.fromARGB(255, 255, 255, 255);

  //Bottom navigation
  static const selectedItemColor = Color.fromARGB(221, 0, 0, 0);
  static const unselectedItemColor = Color.fromARGB(97, 0, 0, 0);


}
