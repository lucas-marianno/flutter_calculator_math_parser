import 'package:flutter/material.dart';

// debugMode
const bool kDebugMode = false;

// enums
enum Emphasis { zero, low, high }

enum MeasurementType { weight, height }

enum MeasurementUnity { imperial, metric }

// Math
const String kDiv0 = 'division by zero';
const String kExpressionError = 'invalid expression';
const String kSqrtNegative = 'error sqrt(-n)';

// Colors
const Color kBackgroundColor = Color(0xff171717);
const Color kInactiveTextColor = Colors.grey;
const Color kShadowColor = Color(0xff171717);
const Color kTextColor = Colors.white;

const Color kLowEmphasisButtonColor = Color(0xff202020);
const Color kDefaultButtonColor = Color(0xff282828);
const Color kHighEmphasisButtonColor = Colors.deepPurpleAccent;

const Color kBMIActiveScreenColor = Color.fromARGB(255, 162, 128, 255);
const Color kBMIInactiveScreenColor = Colors.white;

const Color kUnderweightColor = Colors.lightBlueAccent;
const Color kNormalWeightColor = Colors.green;
const Color kOverweightColor = Colors.orange;
const Color kObeseColor = Colors.red;

// Labels
const String kUnderweightLabel = 'Underweight';
const String kNormalWeightLabel = '    Normal     ';
const String kOverweightLabel = ' Overweight ';
const String kObeseLabel = '     Obese     ';

// Values
const int kCurrentDisplayLimit = 30;

const double kFunctionKeyTextSize = 18;
const double kKeyPadding = 5;
const double kKeyTextSize = 25;
const double kScreenPadding = 20;
const double kScreenLargeTextSize = 75;

const double kGap = 20;
const double kLetterSpacing = 4;

// Shadows
const List<Shadow> kShadow = [
  Shadow(color: kShadowColor, offset: Offset(.5, .5), blurRadius: 5),
];

// TextStyles
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

// Classes
class ButtonId {
  static const String zero = '0',
      one = '1',
      two = '2',
      three = '3',
      four = '4',
      five = '5',
      six = '6',
      seven = '7',
      eight = '8',
      nine = '9',
      equal = '=',
      add = '+',
      subtract = '-',
      multiply = '*',
      divide = '\u00f7',
      openParentheses = '(',
      closeParentheses = ')',
      dot = '.',
      squareRoot = '\u221a',
      c = 'C',
      ac = 'AC',
      delete = '<-',
      power = '^',
      mr = 'MR',
      ms = 'MS',
      mc = 'MC',
      go = 'GO';
  ButtonId();
}
