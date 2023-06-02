import 'package:calculator2/constants.dart';
import 'package:calculator2/widgets/keyboard_default_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle defaultButtonStyle(Emphasis? emphasis) {
  Color color() {
    if (emphasis == Emphasis.high) return kHighEmphasisButtonColor;
    if (emphasis == Emphasis.low) return kLowEmphasisButtonColor;
    return kDefaultButtonColor;
  }

  return ButtonStyle(backgroundColor: MaterialStatePropertyAll(color()));
}

ButtonStyle aboutPageButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: kHighEmphasisButtonColor,
    textStyle: GoogleFonts.robotoMono(fontSize: kKeyTextSize * 0.75),
  );
}
