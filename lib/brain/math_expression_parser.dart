import 'dart:math';
import '../constants.dart';
import '../widgets/keyboard_default_button.dart';

// TODO: Feature: Implement Scientific Notation

// Public Functions:
void debugCalculator() {
  // Map<String, String> testsAddSub = {
  //   '': '0',
  //   '7': '7',
  //   "1+1": '2',
  //   "1.5+1": '2.5',
  //   "2+-2": '0',
  //   "10-2--5": '13',
  //   '45.0+5.0': '50',
  //   "-10.22999999-2.4--5.1": '-7.52999999',
  //   '-12+23342+4533-345-11+987-1+345': '28838',
  // };
  // Map<String, String> testsMultDiv = {
  //   '4/0': 'Infinity',
  //   "8/16": '0.5',
  //   "3*5": '15',
  //   '.5*3': '1.5',
  //   '3*.5': '1.5',
  //   '2*-5': '-10',
  //   '1--2*-2': '-3',
  //   '-10*-10': '100',
  //   '-10*-10*-10': '-1000',
  //   '50+2*3': '56',
  //   '2*2*2*2*2': '32',
  //   '5/6/3/34/6/7': '0.00019452225334578278',
  // };
  // Map<String, String> testsPowSqrt = {
  //   '2^2': '4',
  //   '10^2': '100',
  //   '-10^2': '100',
  //   '10^-2': '0.01',
  //   '-10^-2': '0.01',
  //   '4^2*4^5/4^4': '64',
  //   '-12^2': '144',
  //   '10^2^2': '10000',
  //   '10-12^2': '-134',
  //   '¬81': '9',
  //   '¬9': '3',
  //   '¬-9': 'NaN',
  //   '¬9^2': '9',
  //   '¬2^2': '2',
  // };

  // Map<String, String> testsParenthesis = {
  //   "(6/3)": '2',
  //   "1+(6/3)": '3',
  //   "(6/3)+1": '3',
  //   '(12-10)-1': '1',
  //   "(81)": '81',
  //   '12*(25+1)': '312',
  //   '2(1+2)': '6',
  //   "3-(-1)": '4',
  //   "(((10)))": '10',
  //   "-7*-(6/3)": '14',
  //   '(50+2)*3': '156',
  //   // double
  //   '1-(-2)*-2': '-3',
  //   '(((((((((1+5642)*3656)/44546)-669005)*09096)+7134)-(((((8-4569)/456)+12721)*17569882)-17897893))*11344)/13245235)+16345345':
  //       '-180121098.42022455',
  //   // pow  = / = \u00f7
  //   '5^(-2)': '0.04',
  //   '(9-2)^(2*1)': '49',
  //   '(-10)^2': '100',
  //   '(10-12)^2': '4',
  //   '1-(10-12)^2': '-3',
  //   // sqrt = ¬ = \u221a
  // };

  // Map<String, String> testsAll = {};
  // testsAll.addAll(testsAddSub);
  // testsAll.addAll(testsMultDiv);
  // testsAll.addAll(testsPowSqrt);
  // testsAll.addAll(testsParenthesis);

  // testsAll.forEach((key, value) {
  //   key = key.replaceAll('/', ButtonId.divide);
  //   key = key.replaceAll('¬', ButtonId.squareRoot);
  //   key = implicitMultiplications(key);
  //   String ans =
  //       addSubNew(multDivNew(powSqrtNew(parenthesisNew(separated(key)))))
  //           .toString();
  //   if (ans != value) {
  //     print('\x1B[31mFAILED\x1B[0m at  $key');
  //     print('expected:  $value');
  //     print('got:       $ans');
  //   } else {
  //     print('\x1B[32mPASSED\x1B[0m at  $key');
  //   }
  // });

  // testsParenthesis.forEach((key, value) {
  //   key = key.replaceAll('/', ButtonId.divide);
  //   key = key.replaceAll('¬', ButtonId.squareRoot);
  //   key = implicitMultiplications(key);
  //   print(key);
  //   print(cleaner(key));
  // });

  // String a = '10-2--5';
  // print(a);
  // print(separated(a));
}

String mathExpressionParser(String s) {
  s = removeEqualSignFromExpr(s);
  s = _implicitMultiplications(s);
  if (!_isValidExpression(s)) return kExpressionError;
  String newS =
      _addSubNew(_multDivNew(_powSqrtNew(_parenthesisNew(_separated(s)))))
          .toString();
  if (newS == 'Infinity') return '= $kDiv0';
  if (newS == 'NaN') return '= $kSqrtNegative';
  return '= $newS';
}

String removeEqualSignFromExpr(String s) {
  // if the first character is '=', removes the first and second character ' '.
  return s[0] == '=' ? s = s.substring(2) : s;
}

// Private Functions:
num _addSubNew(List<dynamic> expr) {
  // it can only receive expressions containing '+' | '-'
  // the input will always be valid
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

  // gets rid of trailing .0s and returns it
  ans = num.parse(ans.toString().replaceAll(RegExp(r'\.0+$'), ''));
  return ans;
}

String _cleaner(String s) {
  // removes all unecessary and/or redundant characters in string
  // returns a list with all separated elements

  s[0] == '(' ? s = '0+$s' : s;
  s = s
      .replaceAll('()', '')
      .replaceAll('--', '+')
      .replaceAll('-+ ', '-')
      .replaceAll('+-', '-')
      .replaceAll('**', '^')
      .split('')
      .map((e) => e = '0123456789.'.contains(e) ? e : ' $e ')
      .join();

  return s.replaceAll('  ', ' ').trim().split(' ').join('');
}

bool _isValidExpression(String s) {
  if (s == kExpressionError) return false;
  // if input doesn't contain digits, returns error.
  if (!s.contains(RegExp(r'\d'))) return false;

  // if input ends with '^', returns error.
  if (s.contains(RegExp(r'\^$'))) return false;

  // cleans the expression for trivial errors before evaluating
  s = _cleaner(s);

  // if input contains repeated operands, returns error
  if (s.contains(RegExp('[${ButtonId.divide}^*+]{2,}')) ||
      s.contains('--') ||
      s.contains(ButtonId.squareRoot + ButtonId.squareRoot)) {
    return false;
  }

  // Returns error if the amount of '(' and ')' is not the same
  if ('('.allMatches(s).length != ')'.allMatches(s).length) {
    return false;
  }

  return true;
}

String _implicitMultiplications(String s) {
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

List<dynamic> _innermostExpressionNew(List<dynamic> expr) {
  // it only receives valid inputs
  // Locates the first math expr between () without any () within it
  int lastOpenedParIndex = 0;
  int closeParIndex = 0;
  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == '(') {
      lastOpenedParIndex = i;
    } else if (expr[i] == ')') {
      closeParIndex = i;
      break;
    }
  }
  final List<dynamic> inner =
      expr.sublist(lastOpenedParIndex + 1, closeParIndex);

  final List<dynamic> replacement = [
    _addSubNew(_multDivNew(_powSqrtNew(inner)))
  ];

  expr.replaceRange(lastOpenedParIndex, closeParIndex + 1, replacement);

  return expr;
}

List<dynamic> _multDivNew(List<dynamic> expr) {
  // it can only receive expressions containing '+' | '-' | '/' | '*'
  // goes through a string and executes all mults and divs within it
  // while preserving '+' | '-'
  // the input will always be valid

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

List<dynamic> _parenthesisNew(List<dynamic> expr) {
  // Skips this function if no parentheses are found
  if (!expr.contains('(')) return expr;

  // Locates the first math expr between () without any () within it,
  // resolves the first innermost expression, replaces its range with its result,
  // returns a newExpr with the first innermost expression resolved,
  // iterates recursively until there are no more parenthesis in the expression.
  List<dynamic> newExpr = _innermostExpressionNew(expr);

  if (newExpr.contains('(')) {
    newExpr = _parenthesisNew(newExpr);
  }
  // when the expression has no more parenthesis, reorganizes and returns it.
  return _separated(newExpr.join(''));
}

List<dynamic> _powSqrtNew(List<dynamic> expr) {
  // it can only receive expressions containing '+' | '-' | '/' | '*' |'¬' | '^'
  // goes through a string and executes all pows and sqrt within it
  // while preserving '+' | '-' | '/' | '*'
  // the input will always be valid

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

List<dynamic> _separated(String s) {
  // Takes a string, separates digits and non-digit characters, handles
  // negative numbers, and returns a list containing the separated elements.

  String temp = '';
  List<dynamic> ans = [];

  for (var char in s.split('')) {
    // if char is a digit
    if ('0123456789.'.contains(char)) {
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

  for (int i = 0; i < ans.length; i++) {
    // finds negative numbers that might have gotten split in the process and merges them
    if (i >= 2) {
      // if the evaluated element index is 2 or more,
      if (ans[i] is num &&
          ans[i - 1] == '-' &&
          ans[i - 2] is! num &&
          ans[i - 2] != ')') {
        // AND current element is a number,
        // AND the previous element is '-'
        // AND the anteprevious element is NOT a number NOR ')'
        ans[i] = -ans[i];
        ans.removeAt(i - 1);
      }
    } else if (i >= 1) {
      // if the evaluated element index is 1 or more,
      if (ans[i] is num && ans[i - 1] == '-') {
        // AND current element is a number,
        // AND the previous element is '-'
        ans[i] = ans[i] * -1;
        ans.removeAt(i - 1);
      }
    }
    // if the evaluated element index is 0: does nothing to it.
  }

  return ans;
}
