import 'dart:math';
import 'package:calculator2/widgets/keyboard_default_button.dart';
import 'package:calculator2/constants.dart';

// TODO: Feature: Implement Scientific Notation

// TODO: Refactoring: Refactor entire logic to work with List<dynamic> instead of String.

// TODO: Bugfix: List of math errors found:

void debugCalculator() {
  Map<String, String> tests = {
    //+-/*() ¹²³£¢¬¬¬¬¬¬
    "(81)": '81',
    '12*(25+1)': '312',
    '2(1+2)': '6',
    "1+1": '2',
    "8/16": '0.5',
    "3-(-1)": '4',
    "2+-2": '0',
    "10-2--5": '13',
    "(((10)))": '10',
    "3*5": '15',
    "-7*-(6/3)": '14',
    '50+2*3': '56',
    '(50+2)*3': '156',
    // double
    '.5*3': '1.5',
    '3*.5': '1.5',
    '2*-5': '-10',
    '1-(-2)*-2': '-3',
    '1--2*-2': '-3',
    '-10*-10': '100',
    '-10*-10*-10': '-1000',
    '(((((((((1+5642)*3656)/44546)-669005)*09096)+7134)-(((((8-4569)/456)+12721)*17569882)-17897893))*11344)/13245235)+16345345':
        '-180121098.42022455',
    // pow  = / = \u00f7
    '2^2': '4',
    '5^(-2)': '0.04',
    '-10^-2': '0,01',
    '(9-2)^(2*1)': '49',
    '4^2*4^5/4^4': '64',
    '-12^2': '144',
    '-10^2': '100',
    '(-10)^2': '100',
    '10^2^2': '10000',
    '10-12^2': '-134',
    '(10-12)^2': '4',
    '1-(10-12)^2': '-3',
    // sqrt = ¬ = \u221a
    '¬81': '9',
    '¬9': '3',
  };

  //removeEqualSignFromExpr
  // tests.forEach((key, value) {
  //   key = key.replaceAll('/', ButtonId.divide);
  //   key = key.replaceAll('¬', ButtonId.squareRoot);
  //   String ans = removeEqualSignFromExpr(calculateMathExpr(key));
  //   if (ans != value) {
  //     print('\x1B[31mFAILED\x1B[0m at  $key');
  //     print('expected:  $value');
  //     print('got:       $ans');
  //   } else {
  //     print('\x1B[32mPASSED\x1B[0m at  $key');
  //   }
  // });

  tests.forEach((key, value) {
    if (key.contains('-')) {
      print(key);
      print(separated(key));
    }
  });

  // String a = '10-2--5';
  // print(a);
  // print(separated(a));
}

List<dynamic> separated(String s) {
  // Takes a string, separates digits and non-digit characters, handles
  // negative numbers, and returns a list containing the separated elements.

  String temp = '';
  List<dynamic> ans = [];
  // TODO: make this work
  // for (var i = 0; i < s.split('').length; i++) {
  //   print('-------------------------------: ${s[i]}');
  //   print(temp);
  //   print(ans);
  //   if ('0123456789.'.contains(s[i])) {
  //     temp += s[i];
  //   } else {
  //     if (ans.length >= 2) {
  //       if (ans.last == '-' && ans[ans.length - 2] is num) {
  //         ans.removeLast();
  //         ans.add(num.parse('-$temp'));
  //         temp = '';
  //       } else {
  //         ans.add(num.parse(temp));
  //         temp = '';
  //       }
  //     } else if (ans.length >= 1) {
  //       if (ans.last == '-') {
  //         ans.removeLast();
  //         ans.add(num.parse('-$temp'));
  //         temp = '';
  //       }
  //     }
  //     ans.add(s[i]);
  //   }
  // }
  // if (temp.isNotEmpty) {
  //   if (ans.last == '-') {
  //     ans.removeLast();
  //     ans.add(num.parse('-$temp'));
  //   } else {
  //     ans.add(num.parse(temp));
  //   }
  // }
  for (var char in s.split('')) {
    // if char is a digit
    if (RegExp(r'\d').hasMatch(char)) {
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

  // finds negative numbers that might have gotten split in the process and merges them
  for (int i = 0; i < ans.length; i++) {
    // if the cur4rent element is a number, and the previous element is '-'
    if (i >= 2) {
      if (ans[i] is num && ans[i - 1] == '-') {
        // if the anteprevious element is NOT a number
        if (ans[i - 2] is! num) {
          ans[i] = -ans[i];
          ans.removeAt(i - 1);
        }
      }
    } else if (i >= 1) {
      if (ans[i] is num && ans[i - 1] == '-') {
        ans[i] = ans[i] * -1;
        ans.removeAt(i - 1);
      }
    }
  }

  return ans;
}

String calculateMathExpr(String s) {
  s = removeEqualSignFromExpr(s);

  if (!isValidExpression(s)) return kExpressionError;

  // gets rid of trailing .0s and returns it
  return '= ${evaluateParentheses(s).replaceAll(RegExp(r'\.0+$'), '')}';
}

String removeEqualSignFromExpr(String s) {
  // if the first character is '=', removes the first and second character ' '.
  return s[0] == '=' ? s = s.substring(2) : s;
}

bool isValidExpression(String s) {
  if (s == kExpressionError) return false;
  // if input doesn't contain digits, returns error.
  if (!s.contains(RegExp(r'\d'))) return false;

  // if input ends with '^', returns error.
  if (s.contains(RegExp(r'\^$'))) return false;

  // cleans the expression for trivial errors before evaluating
  s = cleaner(s).join();

  // if input contains repeated operators, returns error
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

String evaluateParentheses(String s) {
  // Skips this function if no parentheses are found
  if (!s.contains('(')) return addSub(multDiv(powRoot(s)));

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

  if (s == kExpressionError) return kExpressionError;

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
  // s will never have unresolved parentheses
  // goes through a string and executes all squareroots and power within it
  // while preserving all other symbols such as mult/div | sum/sub

  if (s == kExpressionError) return kExpressionError;

  //skips this function if there's no pow or sqrt
  if (!s.contains('\u221a') && !s.contains(ButtonId.power)) return s;

  //List expr = cleaner(s);
  List expr = s.split('');

  print('------------------------ $expr');

  List result = [];

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == ButtonId.power || expr[i] == ButtonId.squareRoot) {
      // if x^-y:
      num tempNum = expr[i + 1] == '-'
          ? num.parse(expr[i + 2]) * -1
          : num.parse(expr[i + 1]);
      // if -x^y:
      print('i: $i');
      if (i >= 2) {
        if (expr[i - 2] == '-') {
          //TODO
        }
      }
      if (expr[i] == ButtonId.power) {
        result.last = pow(num.parse(expr[i - 1]), tempNum);
      } else {
        // sqrt(0) is invalid
        if (tempNum < 0) return kExpressionError;
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

  if (s == kExpressionError) return kExpressionError;

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
        // division by 0 error.
        if (tempNum == 0) return kExpressionError;
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
  // removes all unecessary and/or redundant characters in string
  // returns a list with all separated elements

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
