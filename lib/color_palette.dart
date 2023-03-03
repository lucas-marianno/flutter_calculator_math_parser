import 'package:flutter/material.dart';

class Palette {
  static Color darkest() => const Color(0xff202020);
  static Color dark() => const Color(0xff303030);
  static Color light() => Colors.white;

  Palette();
}

TextStyle myTextStyle() {
  return TextStyle(
    color: Palette.light(),
    fontSize: 50,
    shadows: [
      Shadow(
        color: Palette.darkest(),
        offset: const Offset(2,2),
        blurRadius: 5,
      ),
    ],
  );
}
