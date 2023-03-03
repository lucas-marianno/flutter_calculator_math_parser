import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  static Color darkest() => const Color(0xff202020);
  static Color dark() => const Color(0xff303030);
  static Color light() => const Color(0xffDDDDDD);

  Palette();
}

TextStyle displayTextStyle() {
  return GoogleFonts.inconsolata(
    color: Palette.light(),
    fontSize: 75,
    shadows: [
      Shadow(
        color: Palette.darkest(),
        offset: const Offset(2,2),
        blurRadius: 5,
      ),
    ],
  );
}

TextStyle keyTextStyle() {
  return GoogleFonts.robotoMono(
    color: Palette.light(),
    fontSize: 20,
    
  );
}
