import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  static Color darkest = const Color(0xff202020);
  static Color dark = const Color(0xff303030);
  static Color light = const Color(0xffDDDDDD);
  static Color textAccentColor = Colors.amber;

  Palette();
}

class DefaultSizes {
  
  static double defaultKeyHeight = 15;
  static double defaultKeyWidth = 70;
  static Size defaultKeySize = Size(defaultKeyWidth, defaultKeyHeight);

  static double defaultKeyPadding = 10;
  static double screenLargeTextSize = 75;
  static double defaultKeyTextSize = 20;
  DefaultSizes();
}

TextStyle displayTextStyle() {
  return GoogleFonts.inconsolata(
    color: Palette.light,
    fontSize: DefaultSizes.screenLargeTextSize,
    shadows: [
      Shadow(
        color: Palette.darkest,
        offset: const Offset(2, 2),
        blurRadius: 5,
      ),
    ],
  );
}

TextStyle keyTextStyle() {
  return GoogleFonts.robotoMono(
    color: Palette.light,
    fontSize: DefaultSizes.defaultKeyTextSize,
  );
}

ElevatedButtonThemeData defaultButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: DefaultSizes.defaultKeySize,
      backgroundColor: Palette.dark,
      foregroundColor: Palette.darkest,
    ),
  );
}

ElevatedButtonThemeData operatorButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(color: Palette.textAccentColor),
      fixedSize: DefaultSizes.defaultKeySize,
      backgroundColor: Palette.dark,
      foregroundColor: Palette.darkest,
    ),
  );
}

ElevatedButtonThemeData memButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: DefaultSizes.defaultKeySize,
      backgroundColor: Palette.dark,
      foregroundColor: Palette.darkest,
    ),
  );
}

ButtonStyle equalButtonStyle(){
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    textStyle: TextStyle(color: Palette.textAccentColor),
    fixedSize: Size(DefaultSizes.defaultKeyWidth*2, DefaultSizes.defaultKeyHeight)
  );
}
