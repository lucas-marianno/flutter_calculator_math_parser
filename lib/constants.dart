import 'package:flutter/material.dart';

// Math Constants
const String expressionError = 'invalid expression';

// Color Constants
const Color kBackgroundColor = Color(0xff171717);
const Color kInactiveTextColor = Colors.grey;
const Color kShadowColor = Color(0xff171717);
const Color kTextColor = Colors.white;

const Color kLowEmphasisButtonColor = Color(0xff202020);
const Color kDefaultButtonColor = Color(0xff282828);
const Color kHighEmphasisButtonColor = Colors.deepPurple;

const Color kBMIActiveScreenColor = Color.fromARGB(255, 162, 128, 255);
const Color kBMIInactiveScreenColor = Colors.white;

const Color kUnderweight = Colors.lightBlueAccent;
const Color kNormalWeight = Colors.green;
const Color kOverweight = Colors.orange;
const Color kObese = Colors.red;

// Values
const int kCurrentDisplayLimit = 30;

const double kFunctionKeyTextSize = 18;
const double kKeyPadding = 5;
const double kKeyTextSize = 25;
const double kScreenPadding = 20;
const double kScreenLargeTextSize = 75;

const double kGap = 20;
const double kLetterSpacing = 4;

// Shadow Constants
const List<Shadow> kShadow = [
  Shadow(color: kShadowColor, offset: Offset(.5, .5), blurRadius: 5),
];

// TextStyle Constants
const TextStyle kButtonTextStyle = TextStyle(fontSize: kKeyTextSize);

const TextStyle kBMIScreenTextStyle = TextStyle(fontSize: kKeyTextSize * 0.75);

const TextStyle kCalulatorMainDisplayTextStyle =
    TextStyle(color: kTextColor, shadows: kShadow);

const TextStyle kFunctionButtonTextStyle =
    TextStyle(fontSize: kKeyTextSize * 0.75);

const TextStyle kMemEntryTextStyle =
    TextStyle(color: kInactiveTextColor, shadows: kShadow);

const TextStyle kBoldTextStyle = TextStyle(
  fontSize: kKeyTextSize * 2,
  letterSpacing: kLetterSpacing,
  fontWeight: FontWeight.bold,
);

const TextStyle kBigBoldTextStyle = TextStyle(
  fontSize: kKeyTextSize * 4,
  letterSpacing: kLetterSpacing,
  fontWeight: FontWeight.bold,
);

const TextStyle kHyperlinkTextStyle = TextStyle(
    color: Color.fromARGB(255, 144, 202, 249),
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.underline);
