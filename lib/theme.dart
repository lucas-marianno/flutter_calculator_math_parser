import 'package:calculator2/constants.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: kButtonBackgroundColor,
    onPrimary: kTextColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: kButtonTextStyle,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kTextColor,
      textStyle: kFunctionButtonTextStyle,
    ),
  ),
);
