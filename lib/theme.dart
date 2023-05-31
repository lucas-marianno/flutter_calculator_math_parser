import 'package:calculator2/constants.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  appBarTheme: const AppBarTheme(elevation: 0, color: kBackgroundColor),
  colorScheme: const ColorScheme.dark(
    primary: kDefaultButtonColor,
    onPrimary: kTextColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: kButtonTextStyle,
    ),
  ),
  scaffoldBackgroundColor: kBackgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kTextColor,
      textStyle: kFunctionButtonTextStyle,
    ),
  ),
);
