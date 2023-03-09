import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  static Color darkest = const Color(0xff171717);
  static Color dark = const Color(0xff282828);
  static Color screenBackground = const Color.fromARGB(255, 40, 40, 37);
  static Color light = const Color(0xffDDDDDD);
  static Color textAccentColor = Colors.amber;

  Palette();
}

class DefaultSizes {
  static double defaultKeyPadding = 5;
  static double screenLargeTextSize = 75;
  static double defaultKeyTextSize = 25;
  static double functionKeyTextSize = 18;
  DefaultSizes();
}

TextStyle displayTextStyle() {
  return GoogleFonts.inconsolata(
    color: Palette.light,
    shadows: [
      Shadow(
        color: Palette.darkest,
        offset: const Offset(.5, .5),
        blurRadius: 5,
      ),
    ],
  );
}

ElevatedButtonThemeData defaultButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 7,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: Palette.dark,
      foregroundColor: Palette.light,
      textStyle: GoogleFonts.robotoMono(
        fontSize: DefaultSizes.defaultKeyTextSize
        ),
    ),
  );
}

ButtonStyle equalButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    textStyle: GoogleFonts.robotoMono(fontSize: DefaultSizes.defaultKeyTextSize),
  );
}

ButtonStyle functionButtonStyle() {
  return TextButton.styleFrom(
    foregroundColor: Palette.light,
    textStyle: GoogleFonts.robotoMono(fontSize: DefaultSizes.defaultKeyTextSize*0.75),
  );
}

ButtonStyle aboutPageButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    textStyle: GoogleFonts.robotoMono(fontSize: DefaultSizes.defaultKeyTextSize*0.75),
  );
}