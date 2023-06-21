import 'package:flutter/material.dart';

// debugMode
const bool kDebugMode = true;

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

const TextStyle kCalulatorMainDisplayTextStyle = TextStyle(color: kTextColor, shadows: kShadow);

const TextStyle kFunctionButtonTextStyle = TextStyle(fontSize: kKeyTextSize * 0.75);

const TextStyle kMemEntryTextStyle = TextStyle(color: kInactiveTextColor, shadows: kShadow);

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
      add = '\u002b',
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
}

// Maps
const Map<String, Widget> kButtonLabel = {
  ButtonId.zero: Text('0'),
  ButtonId.one: Text('1'),
  ButtonId.two: Text('2'),
  ButtonId.three: Text('3'),
  ButtonId.four: Text('4'),
  ButtonId.five: Text('5'),
  ButtonId.six: Text('6'),
  ButtonId.seven: Text('7'),
  ButtonId.eight: Text('8'),
  ButtonId.nine: Text('9'),
  ButtonId.equal: Text('='),
  ButtonId.add: Icon(Icons.add),
  ButtonId.subtract: Icon(Icons.remove),
  ButtonId.multiply: Icon(Icons.close),
  ButtonId.divide: Text('\u00f7'),
  ButtonId.openParentheses: Text('('),
  ButtonId.closeParentheses: Text(')'),
  ButtonId.dot: Text('.'),
  ButtonId.squareRoot: Text('\u221a'),
  ButtonId.c: Text('C'),
  ButtonId.ac: Text('AC'),
  ButtonId.delete: Icon(Icons.backspace_outlined),
  ButtonId.power: Text('x\u02b8'),
  ButtonId.mr: Text('MR'),
  ButtonId.ms: Text('MS'),
  ButtonId.mc: Text('MC'),
  ButtonId.go: Text('GO'),
};

const Map<String, String> kToSuperScript = {
  '0': '\u2070',
  '1': '\u00B9',
  '2': '\u00B2',
  '3': '\u00B3',
  '4': '\u2074',
  '5': '\u2075',
  '6': '\u2076',
  '7': '\u2077',
  '8': '\u2078',
  '9': '\u2079',
  '+': '\u207A',
  '-': '\u207B',
  '=': '\u207C',
  '(': '\u207D',
  ')': '\u207E',
};

const Map<String, String> kFromSuperScript = {
  '\u2070': '0',
  '\u00B9': '1',
  '\u00B2': '2',
  '\u00B3': '3',
  '\u2074': '4',
  '\u2075': '5',
  '\u2076': '6',
  '\u2077': '7',
  '\u2078': '8',
  '\u2079': '9',
  '\u207A': '+',
  '\u207B': '-',
  '\u207C': '=',
  '\u207D': '(',
  '\u207E': ')',
};

const Map<String, (String, String)> unicodeMap = {
  '0': ('\u2070', '\u2080'),
  '1': ('\u00B9', '\u2081'),
  '2': ('\u00B2', '\u2082'),
  '3': ('\u00B3', '\u2083'),
  '4': ('\u2074', '\u2084'),
  '5': ('\u2075', '\u2085'),
  '6': ('\u2076', '\u2086'),
  '7': ('\u2077', '\u2087'),
  '8': ('\u2078', '\u2088'),
  '9': ('\u2079', '\u2089'),
  'a': ('\u1d43', '\u2090'),
  'b': ('\u1d47', '?'),
  'c': ('\u1d9c', '?'),
  'd': ('\u1d48', '?'),
  'e': ('\u1d49', '\u2091'),
  'f': ('\u1da0', '?'),
  'g': ('\u1d4d', '?'),
  'h': ('\u02b0', '\u2095'),
  'i': ('\u2071', '\u1d62'),
  'j': ('\u02b2', '\u2c7c'),
  'k': ('\u1d4f', '\u2096'),
  'l': ('\u02e1', '\u2097'),
  'm': ('\u1d50', '\u2098'),
  'n': ('\u207f', '\u2099'),
  'o': ('\u1d52', '\u2092'),
  'p': ('\u1d56', '\u209a'),
  'q': ('?', '?'),
  'r': ('\u02b3', '\u1d63'),
  's': ('\u02e2', '\u209b'),
  't': ('\u1d57', '\u209c'),
  'u': ('\u1d58', '\u1d64'),
  'v': ('\u1d5b', '\u1d65'),
  'w': ('\u02b7', '?'),
  'x': ('\u02e3', '\u2093'),
  'y': ('\u02b8', '?'),
  'z': ('?', '?'),
  'A': ('\u1d2c', '?'),
  'B': ('\u1d2e', '?'),
  'C': ('?', '?'),
  'D': ('\u1d30', '?'),
  'E': ('\u1d31', '?'),
  'F': ('?', '?'),
  'G': ('\u1d33', '?'),
  'H': ('\u1d34', '?'),
  'I': ('\u1d35', '?'),
  'J': ('\u1d36', '?'),
  'K': ('\u1d37', '?'),
  'L': ('\u1d38', '?'),
  'M': ('\u1d39', '?'),
  'N': ('\u1d3a', '?'),
  'O': ('\u1d3c', '?'),
  'P': ('\u1d3e', '?'),
  'Q': ('?', '?'),
  'R': ('\u1d3f', '?'),
  'S': ('?', '?'),
  'T': ('\u1d40', '?'),
  'U': ('\u1d41', '?'),
  'V': ('\u2c7d', '?'),
  'W': ('\u1d42', '?'),
  'X': ('?', '?'),
  'Y': ('?', '?'),
  'Z': ('?', '?'),
  '+': ('\u207A', '\u208A'),
  '-': ('\u207B', '\u208B'),
  '=': ('\u207C', '\u208C'),
  '(': ('\u207D', '\u208D'),
  ')': ('\u207E', '\u208E'),
  ':alpha': ('\u1d45', '?'),
  ':beta': ('\u1d5d', '\u1d66'),
  ':gamma': ('\u1d5e', '\u1d67'),
  ':delta': ('\u1d5f', '?'),
  ':epsilon': ('\u1d4b', '?'),
  ':theta': ('\u1dbf', '?'),
  ':iota': ('\u1da5', '?'),
  ':pho': ('?', '\u1d68'),
  ':phi': ('\u1db2', '?'),
  ':psi': ('\u1d60', '\u1d69'),
  ':chi': ('\u1d61', '\u1d6a'),
  ':coffee': ('\u2615', '\u2615')
};
