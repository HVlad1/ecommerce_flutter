
import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemeData {
  ThemeData get appThemeData {
    const textColorWhite = CustomColors.textColorOnCard;
    const textColorBlack = CustomColors.textColorOnWhite;
    const textColorRed = CustomColors.error;

    const letterSpacing = 0.0;
    return ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: CustomColors.onPrimary
          ),
        ),
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme(
          primary: CustomColors.primary,
          secondary: CustomColors.secondary,
          background: CustomColors.unused,
          surface: CustomColors.surface,
          onBackground: CustomColors.unused,
          error: CustomColors.error,
          onError: CustomColors.onError,
          onPrimary: CustomColors.onPrimary,
          onSecondary: CustomColors.unused,
          onSurface: CustomColors.onSurface,
          brightness: Brightness.light,
        ),
        indicatorColor: CustomColors.secondary,
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: "SanFrancisco",
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: textColorBlack,
            height: 1,
          ),
          headline2: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: textColorRed,
            letterSpacing: letterSpacing,
            height: 1,
          ),
          headline3: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColorBlack,
            letterSpacing: letterSpacing,
            height: 1,
          ),
          headline4: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: textColorWhite,
            letterSpacing: letterSpacing,
            height: 1,
          ),
          headline5: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: textColorBlack,
            letterSpacing: letterSpacing,
            height: 1,
          ),
          headline6: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: textColorBlack.withOpacity(0.8),
            letterSpacing: letterSpacing,
            height: 1,
          ),
          bodyText1: const TextStyle(
            fontSize: 16,
            color: textColorWhite,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            color: textColorBlack.withOpacity(0.8),
            fontWeight: FontWeight.w400,
            letterSpacing: letterSpacing,
            height: 1,
          ),
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: CustomColors.secondary,
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: textColorWhite),
        ));
  }
}
