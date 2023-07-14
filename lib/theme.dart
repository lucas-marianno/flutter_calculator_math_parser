import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData material3themeData = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(elevation: 0, color: kBackgroundColor),
  colorScheme: const ColorScheme.dark(),
  scaffoldBackgroundColor: kBackgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kTextColor,
      textStyle: kFunctionButtonTextStyle,
    ),
  ),
);

ThemeData material2themeData = ThemeData(
  useMaterial3: false,
  appBarTheme: const AppBarTheme(elevation: 0, color: kBackgroundColor),
  colorScheme: ColorScheme.fromSeed(
    seedColor: kHighEmphasisButtonColor,
    brightness: Brightness.dark,
  ),
  // colorScheme: const ColorScheme.dark(
  //   primary: kDefaultButtonColor,
  //   onPrimary: kTextColor,
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: kButtonTextStyle,
      foregroundColor: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: kBackgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kTextColor,
      padding: EdgeInsets.zero,
      textStyle: kFunctionButtonTextStyle,
    ),
  ),
);
