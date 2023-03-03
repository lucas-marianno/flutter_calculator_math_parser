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
  
  static double defaultKeyHeight = 100;
  static double defaultKeyWidth = 75;
  static Size defaultKeySize = Size(defaultKeyWidth, defaultKeyHeight);

  static double defaultKeyPadding = 5;
  static double screenLargeTextSize = 75;
  static double defaultKeyTextSize = 25;
  static double functionKeyTextSize = 18;
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

ElevatedButtonThemeData defaultButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      //fixedSize: DefaultSizes.defaultKeySize,
      backgroundColor: Palette.dark,
      foregroundColor: Palette.light,
      textStyle: GoogleFonts.robotoMono(fontSize: DefaultSizes.defaultKeyTextSize),
      
    ),
  );
}

ButtonStyle operatorButtonThemeData() {
  return ElevatedButton.styleFrom(
      fixedSize: DefaultSizes.defaultKeySize,
      backgroundColor: Palette.dark,
      foregroundColor: Palette.light,
      textStyle: GoogleFonts.robotoMono(fontSize: DefaultSizes.defaultKeyTextSize*1.5),
  );
}

ButtonStyle functionButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 0,
    fixedSize:
        Size(DefaultSizes.defaultKeyWidth, DefaultSizes.defaultKeyHeight / 2),
    backgroundColor: Palette.darkest,
    textStyle: GoogleFonts.robotoMono(fontSize: DefaultSizes.functionKeyTextSize),
  );
}

ButtonStyle equalButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    fixedSize: Size(
      DefaultSizes.defaultKeyWidth * 2 + DefaultSizes.defaultKeyPadding * 2,
      DefaultSizes.defaultKeyHeight),
    textStyle: GoogleFonts.robotoMono(fontSize: DefaultSizes.defaultKeyTextSize),
  );
}
