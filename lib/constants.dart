import 'package:flutter/material.dart';

// Math Constants
const String expressionError = 'invalid expression';

// Color Constants
const Color kAboutScreenBackgroundColor = Color(0xff282828);
const Color kBackgroundColor = Color(0xff171717);
const Color kInactiveTextColor = Colors.grey;
const Color kScreenBackground = Color.fromARGB(255, 40, 40, 37);
const Color kShadowColor = Color(0xff171717);
const Color kTextColor = Colors.white;

const Color kLowEmphasisButtonColor = Color(0xff202020);
const Color kDefaultButtonColor = Color(0xff282828);
const Color kHighEmphasisButtonColor = Colors.deepPurple;

// Values
const double kFunctionKeyTextSize = 18;
const double kKeyPadding = 5;
const double kKeyTextSize = 25;
const double kScreenLargeTextSize = 75;

// Shadow Constants
const List<Shadow> kShadow = [
  Shadow(color: kShadowColor, offset: Offset(.5, .5), blurRadius: 5),
];

// TextStyle Constants
const TextStyle kButtonTextStyle = TextStyle(fontSize: kKeyTextSize);
const TextStyle kDisplayTextStyle = TextStyle(
  color: kTextColor,
  shadows: kShadow,
);
const TextStyle kFunctionButtonTextStyle = TextStyle(
  fontSize: kKeyTextSize * 0.75,
);
const TextStyle kMemEntryTextStyle = TextStyle(
  color: kInactiveTextColor,
  shadows: kShadow,
);
