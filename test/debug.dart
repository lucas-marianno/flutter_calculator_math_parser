// ignore_for_file: avoid_print

import 'package:math_expression_parser/brain/logic.dart';
import 'package:math_expression_parser/brain/math_expression_parser.dart';
import '../lib/constants.dart';

class Debug {
  static debugCalculator() {
    if (kDebugMode) {
      Map<String, String> testsAddSub = {
        '7': '7',
        "1+1": '2',
        "1.5+1": '2.5',
        "2+-2": '0',
        "10-2--5": '13',
        '45.0+5.0': '50',
        "-10.22999999-2.4--5.1": '-7.52999999',
        '-12+23342+4533-345-11+987-1+345': '28838',
      };
      Map<String, String> testsMultDiv = {
        '4/0': kDiv0,
        "8/16": '0.5',
        "3*5": '15',
        '.5*3': '1.5',
        '3*.5': '1.5',
        '2*-5': '-10',
        '1--2*-2': '-3',
        '-10*-10': '100',
        '-10*-10*-10': '-1000',
        '50+2*3': '56',
        '2*2*2*2*2': '32',
        '5/6/3/34/6/7': '0.00019452225334578278',
      };
      Map<String, String> testsPowSqrt = {
        '2^2': '4',
        '10^2': '100',
        '-10^2': '100',
        '10^-2': '0.01',
        '-10^-2': '0.01',
        '4^2*4^5/4^4': '64',
        '-12^2': '144',
        '10^2^2': '10000',
        '10-12^2': '-134',
        '¬81': '9',
        '¬9': '3',
        '¬-9': kSqrtNegative,
        '¬9^2': '9',
        '¬2^2': '2.0000000000000004',
      };

      Map<String, String> testsParenthesis = {
        "(6/3)": '2',
        "1+(6/3)": '3',
        "(6/3)+1": '3',
        '(12-10)-1': '1',
        "(81)": '81',
        '12*(25+1)': '312',
        '2(1+2)': '6',
        "3-(-1)": '4',
        "(((10)))": '10',
        "-7*-(6/3)": '14',
        '(50+2)*3': '156',
        // double
        '1-(-2)*-2': '-3',
        '(((((((((1+5642)*3656)/44546)-669005)*09096)+7134)-(((((8-4569)/456)+12721)*17569882)-17897893))*11344)/13245235)+16345345':
            '-180121098.42022455',
        // pow  = / = \u00f7
        '5^(-2)': '0.04',
        '(9-2)^(2*1)': '49',
        '(-10)^2': '100',
        '(10-12)^2': '4',
        '1-(10-12)^2': '-3',
        // sqrt = ¬ = \u221a
      };

      Map<String, String> testsAll = {};
      testsAll.addAll(testsAddSub);
      testsAll.addAll(testsMultDiv);
      testsAll.addAll(testsPowSqrt);
      testsAll.addAll(testsParenthesis);

      testsAll.forEach((key, value) {
        key = key.replaceAll('/', ButtonId.divide);
        key = key.replaceAll('¬', ButtonId.squareRoot);

        //key = Parser.implicitMultiplications(key);
        String ans = Parser.evaluateExpression(key);
        ans = Logic.removeEqualSignFromExpr(ans);
        if (ans != value) {
          print('\x1B[31mFAILED\x1B[0m at  $key');
          print('expected:  $value');
          print('got:       $ans');
        } else {
          print('\x1B[32mPASSED\x1B[0m at  $key');
        }
      });
    }
  }
}
