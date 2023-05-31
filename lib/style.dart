import 'package:calculator2/constants.dart';
import 'package:calculator2/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle defaultButtonStyle(Emphasis? emphasis) {
  Color? color() {
    if (emphasis == Emphasis.max) return kMaxEmphasisButtonColor;
    if (emphasis == Emphasis.medium) return kMediumEmphasisButtonColor;
    return null;
  }

  return ButtonStyle(backgroundColor: MaterialStatePropertyAll(color()));
}

ButtonStyle aboutPageButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: kMaxEmphasisButtonColor,
    textStyle: GoogleFonts.robotoMono(fontSize: kKeyTextSize * 0.75),
  );
}
