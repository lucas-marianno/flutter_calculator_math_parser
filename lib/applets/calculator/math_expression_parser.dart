import 'dart:math';
import '../../constants.dart';
import '../../brain/input_handler.dart';

// TODO: Feature: Implement Scientific Notation

class Parser with ParserUtilities {
  // Public Functions:

  static String evaluateExpression(String s) {
    s = _cleaner(s);

    if (!_isValidExpression(s)) return kExpressionError;

    String newS = _tryToInt(_addSub(_multDiv(_powSqrt(_parenthesis(_separated(s)))))).toString();

    if (newS == 'Infinity') return '= $kDiv0';
    if (newS == 'NaN') return '= $kSqrtNegative';
    return '= $newS';
  }

  // Private Functions:

  static num _addSub(List<dynamic> expr) {
    // it can only receive expressions containing '+' | '-'
    // the input must always be valid

    if (!expr.contains(ButtonId.add) && !expr.contains(ButtonId.subtract)) {
      return num.parse(expr.join());
    }

    num ans = 0;

    for (int i = 0; i < expr.length; i++) {
      if (expr[i] is num) {
        if (i >= 1) {
          if (expr[i - 1] == '+') {
            ans += expr[i];
          } else if (expr[i - 1] == '-') {
            ans -= expr[i];
          }
        } else {
          ans += expr[i];
        }
      }
    }
    return ans;
  }

  static String _autoParentheses(String s) {
    int nOfOpenPar = 0;
    int nOfClosePar = 0;
    int lastOpenParIndex = 0;
    int lastCloseParIndex = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == ButtonId.openParentheses) {
        nOfOpenPar++;
        lastOpenParIndex = i;
      } else if (s[i] == ButtonId.closeParentheses) {
        nOfClosePar++;
        lastCloseParIndex = i;
      }
    }
    if (nOfClosePar == nOfOpenPar) {
      return s;
    } else if (lastOpenParIndex > lastCloseParIndex) {
      return s + ButtonId.closeParentheses;
    } else {
      return kExpressionError;
    }
  }

  static String _cleaner(String s) {
    s = ParserUtilities.removeEqualSignFromExpr(s);

    s[0] == '(' ? s = '0+$s' : s;
    s = s
        .replaceAll('()', '')
        .replaceAll('--', '+')
        .replaceAll('-+ ', '-')
        .replaceAll('+-', '-')
        .replaceAll('**', '^');

    s = _autoParentheses(s);
    s = _implicitMultiplications(s);
    return s;
  }

  static bool _isValidExpression(String s) {
    if (s == kExpressionError) return false;

    // if input doesn't contain digits
    if (!s.contains(RegExp(r'\d'))) return false;

    // if input ends with '^'
    if (s.contains(RegExp(r'\^$'))) return false;

    // cleans the expression for trivial errors before evaluating
    s = _cleaner(s);

    // if input contains repeated operands
    if (s.contains(RegExp('[${ButtonId.divide}^*+]{2,}')) ||
        s.contains('--') ||
        s.contains(ButtonId.squareRoot + ButtonId.squareRoot)) {
      return false;
    }

    // if the amount of '(' and ')' is not the same
    if ('('.allMatches(s).length != ')'.allMatches(s).length) {
      return false;
    }

    return true;
  }

  static String _implicitMultiplications(String s) {
    // Resolves all implicit multiplications.
    // Example: (2)3 = (2)*3 | 2(3) = 2*(3) | (2)(3) = (2)*(3)
    // Replaces all '(' preceded with a digit with '*('
    s = s.replaceAllMapped(RegExp(r'\d\('), (m) => '${s.substring(m.start, m.end - 1)}*(');

    // Replaces all ')' followed by a digit with ')*'
    s = s.replaceAllMapped(RegExp(r'\)\d'), (m) => ')*${s.substring(m.start + 1, m.end)}');

    s = s.replaceAll(')(', ')*(');

    return s;
  }

  static List<dynamic> _innermostExpression(List<dynamic> expr) {
    // it only receives valid inputs
    // Locates the first math expr between () without any () within it
    int lastOpenedParIndex = 0;
    int closeParIndex = 0;
    for (int i = 0; i < expr.length; i++) {
      if (expr[i] == ButtonId.openParentheses) {
        lastOpenedParIndex = i;
      } else if (expr[i] == ButtonId.closeParentheses) {
        closeParIndex = i;
        break;
      }
    }
    final List<dynamic> inner = expr.sublist(lastOpenedParIndex + 1, closeParIndex);

    final List<dynamic> replacement = [_addSub(_multDiv(_powSqrt(inner)))];

    expr.replaceRange(lastOpenedParIndex, closeParIndex + 1, replacement);

    return expr;
  }

  static List<dynamic> _multDiv(List<dynamic> expr) {
    // it can only receive expressions containing '+' | '-' | '/' | '*'
    // goes through a string and executes all mults and divs within it
    // the input must always be valid

    if (!expr.contains(ButtonId.multiply) && !expr.contains(ButtonId.divide)) {
      return expr;
    }

    List temp = [];

    for (int i = 0; i < expr.length; i++) {
      if (expr[i] == ButtonId.multiply) {
        temp.last *= expr[i + 1];
        i++;
      } else if (expr[i] == ButtonId.divide) {
        temp.last /= expr[i + 1];
        i++;
      } else {
        temp.add(expr[i]);
      }
    }

    return temp;
  }

  static List<dynamic> _parenthesis(List<dynamic> expr) {
    // Locates the first math expr between () without any () within it,
    // resolves the first innermost expression, replaces its range with its result,
    // returns a newExpr with the first innermost expression resolved,
    // iterates recursively until there are no more parenthesis in the expression.

    if (!expr.contains('(')) return expr;

    List<dynamic> newExpr = _innermostExpression(expr);

    if (newExpr.contains('(')) {
      newExpr = _parenthesis(newExpr);
    }
    // when the expression has no more parenthesis, reorganizes and returns it.
    return _separated(newExpr.join(''));
  }

  static List<dynamic> _powSqrt(List<dynamic> expr) {
    // it can only receive expressions containing '+' | '-' | '/' | '*' |'¬' | '^'
    // goes through a string and executes all pows and sqrt within it
    // while preserving '+' | '-' | '/' | '*'
    // the input must always be valid

    if (!expr.contains(ButtonId.squareRoot) && !expr.contains(ButtonId.power)) {
      return expr;
    }

    List temp = [];

    for (int i = 0; i < expr.length; i++) {
      if (expr[i] == ButtonId.power) {
        temp.last = pow(temp.last, expr[i + 1]);
        i++;
      } else if (expr[i] == ButtonId.squareRoot) {
        temp.add(sqrt(expr[i + 1]));
        i++;
      } else {
        temp.add(expr[i]);
      }
    }

    return temp;
  }

  static List<dynamic> _separated(String s) {
    // Takes a string, separates digits and non-digit characters, handles
    // negative numbers, and returns a list containing the separated elements.

    String temp = '';
    List<dynamic> ans = [];

    for (var char in s.split('')) {
      if (ParserUtilities.isDigit(char)) {
        temp += char;
      } else {
        if (temp.isNotEmpty) {
          ans.add(num.parse(temp));
          temp = '';
        }
        ans.add(char);
      }
    }
    if (temp.isNotEmpty) ans.add(num.parse(temp));

    for (int i = 1; i < ans.length; i++) {
      // finds negative numbers that might have gotten split in the process and merges them

      final bool elementIsNum = ans[i] is num;
      final bool previousElementIsMinus = ans[i - 1] == '-';

      if (elementIsNum && previousElementIsMinus) {
        if (i >= 2) {
          final bool antepenultimateIsNum = ans[i - 2] is num;
          final bool antepenultimateIsClosePar = ans[i - 2] == ')';

          if (!antepenultimateIsNum && !antepenultimateIsClosePar) {
            ans[i] = -ans[i];
            ans.removeAt(i - 1);
          }
        } else {
          ans[i] = ans[i] * -1;
          ans.removeAt(i - 1);
        }
      }
    }

    return ans;
  }

  static num _tryToInt(num expr) {
    // gets rid of trailing .0s and returns it
    return num.parse(expr.toString().replaceAll(RegExp(r'\.0+$'), ''));
  }
}
