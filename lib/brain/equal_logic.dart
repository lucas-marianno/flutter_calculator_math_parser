import 'dart:math';
import 'package:calculator2/widgets/keyboard_default_button.dart';
import 'package:calculator2/constants.dart';
import 'logic.dart';

// TODO: Feature: Implement Scientific Notation
/// TODO: Bugfix: List of math errors found:
///
/// 12^ = RangeError (RangeError (index): Invalid value: Not in inclusive range 0..1: 2)
/// -10^2 returns: -100 expected: 100
/// 63666*5674615876423786782365478627836457823475827346 returns: 32.34563456345 expected: 'a lot bigger than that'
/// 10^2^2 returns: 4 expected: 10000. A possible solution is to go from right to left in the loop
///
String calculateMathExpr(String s) {
  s = removeEqualSignFromScreen(s);

  // if input doesn't contain digits, returns error
  if (!s.contains(RegExp(r'\d'))) return expressionError;

  // cleans the expression for trivial errors before computing
  s = cleaner(s).join();

  // if input contains repeated operators, returns error
  if (s.contains(RegExp('[${ButtonId.divide}^*+]{2,}')) ||
      s.contains('--') ||
      s.contains(ButtonId.squareRoot + ButtonId.squareRoot)) {
    return expressionError;
  }

  // gets rid of trailing .0s and returns it
  return '= ${evaluateParentheses(s).replaceAll(RegExp(r'\.0+$'), '')}';
}

String evaluateParentheses(String s) {
  // Skips this function if no parentheses are found
  if (!s.contains('(')) return addSub(multDiv(powRoot(s)));

  // Returns error if the amount of '(' and ')' is not the same
  if ('('.allMatches(s).length != ')'.allMatches(s).length) {
    return expressionError;
  }

  // Resolves all implicit multiplications.
  s = implicitMultiplications(s);

  // Locates the first math expr between () without any () within it
  final String inner = innermostExpression(s);

  s = s.replaceAll('($inner)', addSub(multDiv(powRoot(inner))));
  if (s.contains('(')) {
    s = evaluateParentheses(s);
  }

  return addSub(multDiv(powRoot(s)));
}

String innermostExpression(String s) {
  // Locates the first math expr between () without any () within it
  String innermostExpr = RegExp(r'\([^\(\)]+\)').firstMatch(s)![0]!;

  // Removes the parentheses from both start and end, saving a clean expression
  return innermostExpr.substring(1, innermostExpr.length - 1);
}

String implicitMultiplications(String s) {
  // Resolves all implicit multiplications.
  // Example: (2)3 = (2)*3 | 2(3) = 2*(3) | (2)(3) = (2)*(3)
  // Replaces all '(' preceded with a digit with '*('
  s = s.replaceAllMapped(
      RegExp(r'\d\('), (m) => '${s.substring(m.start, m.end - 1)}*(');

  // Replaces all ')' followed by a digit with ')*'
  s = s.replaceAllMapped(
      RegExp(r'\)\d'), (m) => ')*${s.substring(m.start + 1, m.end)}');

  s = s.replaceAll(')(', ')*(');

  return s;
}

bool isNum(String s) => '0123456789'.contains(s);

String addSub(String s) {
  //goes through a string and either adds or subtracts the next value
  //returns the sum of all operations

  if (s == expressionError) return expressionError;

  //skips this function if there's no adition or subtraction
  if (!s.contains('-') && !s.contains('+')) return s;

  List expr = cleaner(s);
  num result = 0;

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == '+') {
      result += num.parse(expr[i + 1]);
    } else if (expr[i] == '-') {
      result -= num.parse(expr[i + 1]);
    } else if (i == 0) {
      result += num.parse(expr[i]);
    }
  }

  return result.toString();
}

String powRoot(String s) {
  //goes through a string and executes all squareroots and power within it
  //while preserving all other symbols such as parentheses and/or sum/sub

  if (s == expressionError) return expressionError;

  //skips this function if there's no pow or sqrt
  if (!s.contains('\u221a') && !s.contains(ButtonId.power)) return s;

  List expr = cleaner(s);
  List result = [];

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == ButtonId.power || expr[i] == ButtonId.squareRoot) {
      num tempNum = expr[i + 1] == '-'
          ? num.parse(expr[i + 2]) * -1
          : num.parse(expr[i + 1]);
      if (expr[i] == ButtonId.power) {
        result.last = pow(num.parse(expr[i - 1]), tempNum);
      } else {
        if (tempNum < 0) return expressionError;
        if (i > 0 && isNum(result.last)) result.add('*');

        result.add(sqrt(tempNum));
      }
      expr[i + 1] == '-' ? i += 2 : i++;
    } else {
      result.add(expr[i]);
    }
  }
  return result.join(' ');
}

String multDiv(String s) {
  //goes through a string and executes all multiplications and divisions within it
  //while preserving all other symbols such as parentheses and/or sum/sub

  if (s == expressionError) return expressionError;

  //skips this function if there's no division or multiplication
  if (!s.contains(ButtonId.divide) && !s.contains(ButtonId.multiply)) return s;

  List expr = cleaner(s);
  List result = [];

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == ButtonId.multiply || expr[i] == ButtonId.divide) {
      num tempNum = expr[i + 1] == '-'
          ? num.parse(expr[i + 2]) * -1
          : num.parse(expr[i + 1]);

      if (expr[i] == ButtonId.divide) {
        if (tempNum == 0) return expressionError;
        result.last = (num.parse(result.last) / tempNum).toString();
      } else {
        result.last = (num.parse(result.last) * tempNum).toString();
      }
      expr[i + 1] == '-' ? i += 2 : i++;
    } else {
      result.add(expr[i]);
    }
  }
  return result.join(' ');
}

List cleaner(String s) {
  //removes all unecessary and/or redundant characters in string
  //returns a list with all separated elements

  // if the string ends with a '+', replaces it with '*2'
  s = s.endsWith('+') ? s.replaceRange(s.length - 1, null, '*2') : s;

  s[0] == '(' ? s = '0+$s' : s;
  s = s
      .replaceAll(' ', '')
      .replaceAll('()', '')
      .replaceAll('--', '+')
      .replaceAll('-+ ', '-')
      .replaceAll('+-', '-')
      .replaceAll('**', '^')
      .split('')
      .map((e) => e = '0123456789.'.contains(e) ? e : ' $e ')
      .join();

  return s.replaceAll('  ', ' ').trim().split(' ');
}
