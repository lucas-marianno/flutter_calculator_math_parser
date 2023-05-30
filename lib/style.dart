import 'package:calculator2/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle equalButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: kAccentColor,
    textStyle: GoogleFonts.robotoMono(fontSize: kKeyTextSize),
  );
}

ButtonStyle aboutPageButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: kAccentColor,
    textStyle: GoogleFonts.robotoMono(fontSize: kKeyTextSize * 0.75),
  );
}
