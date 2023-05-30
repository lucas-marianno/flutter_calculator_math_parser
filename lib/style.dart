import 'package:calculator2/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle displayTextStyle() {
  return GoogleFonts.inconsolata(
    color: kTextColor,
    shadows: kShadow,
  );
}

ElevatedButtonThemeData defaultButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 7,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: kButtonBackgroundColor,
      foregroundColor: kTextColor,
      textStyle: GoogleFonts.robotoMono(fontSize: kKeyTextSize),
    ),
  );
}

ButtonStyle equalButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: kAccentColor,
    textStyle: GoogleFonts.robotoMono(fontSize: kKeyTextSize),
  );
}

ButtonStyle functionButtonStyle() {
  return TextButton.styleFrom(
    foregroundColor: kTextColor,
    textStyle: GoogleFonts.robotoMono(fontSize: kKeyTextSize * 0.75),
  );
}

ButtonStyle aboutPageButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: kAccentColor,
    textStyle: GoogleFonts.robotoMono(fontSize: kKeyTextSize * 0.75),
  );
}
