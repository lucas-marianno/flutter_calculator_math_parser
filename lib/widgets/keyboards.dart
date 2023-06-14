import 'package:flutter/material.dart';
import 'package:math_expression_parser/pages/calculator_page.dart';
import 'package:math_expression_parser/pages/simple_calculator.dart';
import '../constants.dart';
import '../routes.dart';
import 'keyboard_default_button.dart';

class Keyboards {
  static List<List<Widget>> simpleKeyboard(Function function, {BuildContext? context}) => [
        [
          DefaultButton(ButtonId.mr, function, emphasis: Emphasis.zero),
          DefaultButton(ButtonId.mc, function, emphasis: Emphasis.zero),
          DefaultButton(ButtonId.ms, function, emphasis: Emphasis.zero),
        ],
        [
          DefaultButton(ButtonId.c, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.ac, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.delete, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.divide, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(ButtonId.seven, function),
          DefaultButton(ButtonId.eight, function),
          DefaultButton(ButtonId.nine, function),
          DefaultButton(ButtonId.multiply, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(ButtonId.four, function),
          DefaultButton(ButtonId.five, function),
          DefaultButton(ButtonId.six, function),
          DefaultButton(ButtonId.subtract, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(ButtonId.one, function),
          DefaultButton(ButtonId.two, function),
          DefaultButton(ButtonId.three, function),
          DefaultButton(ButtonId.add, function, emphasis: Emphasis.low),
        ],
        [
          Expanded(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(kKeyPadding * 4),
                child: IconButton(
                  icon: const Icon(Icons.calculate_outlined),
                  color: kHighEmphasisButtonColor,
                  onPressed: () {
                    if (context != null) {
                      print('hi');
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const CalculatorPage()));
                    }
                  },
                ),
              ),
            ),
          ),
          DefaultButton(ButtonId.zero, function),
          DefaultButton(ButtonId.dot, function),
          DefaultButton(ButtonId.equal, function, emphasis: Emphasis.high),
        ],
      ];

  static List<List<Widget>> numericKeyboard(Function function, {BuildContext? context}) => [
        [
          DefaultButton(ButtonId.seven, function),
          DefaultButton(ButtonId.eight, function),
          DefaultButton(ButtonId.nine, function),
        ],
        [
          DefaultButton(ButtonId.four, function),
          DefaultButton(ButtonId.five, function),
          DefaultButton(ButtonId.six, function),
        ],
        [
          DefaultButton(ButtonId.one, function),
          DefaultButton(ButtonId.two, function),
          DefaultButton(ButtonId.three, function),
        ],
        [
          Expanded(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(kKeyPadding * 4),
                child: IconButton(
                  icon: const Icon(Icons.calculate_outlined),
                  color: kHighEmphasisButtonColor,
                  onPressed: () {
                    if (context != null) {
                      if (context.toString() == '$NumericKeyboardModular') {
                        Navigator.pushNamed(context, Pages.calculatorPage);
                      } else if (context.toString() == '$FullKeyboardModular') {
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          DefaultButton(ButtonId.zero, function),
          DefaultButton(ButtonId.dot, function),
        ],
      ];
  static List<Widget> mem(Function function) => [
        DefaultButton(ButtonId.mr, function, emphasis: Emphasis.zero),
        DefaultButton(ButtonId.mc, function, emphasis: Emphasis.zero),
        DefaultButton(ButtonId.ms, function, emphasis: Emphasis.zero),
      ];
  static List<Widget> rowfunc(Function function) => [
        DefaultButton(ButtonId.squareRoot, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.power, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.c, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.ac, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.delete, function, emphasis: Emphasis.low),
      ];
  static List<Widget> simpleRowfunc(Function function) => [
        DefaultButton(ButtonId.c, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.ac, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.delete, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.divide, function, emphasis: Emphasis.low),
      ];
  static List<Widget> simpleOperators(Function function) => [
        DefaultButton(ButtonId.multiply, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.subtract, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.add, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.equal, function, emphasis: Emphasis.high),
      ];
  static List<List<Widget>> operators(Function function) => [
        [
          DefaultButton(ButtonId.openParentheses, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.closeParentheses, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(ButtonId.multiply, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.divide, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(ButtonId.add, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.subtract, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(
            ButtonId.equal,
            function,
            flex: 2,
            emphasis: Emphasis.high,
          ),
        ],
      ];
  static List<List<Widget>> calculatorKeyboard(Function function, {BuildContext? context}) => [
        [
          DefaultButton(ButtonId.mr, function, emphasis: Emphasis.zero),
          DefaultButton(ButtonId.mc, function, emphasis: Emphasis.zero),
          DefaultButton(ButtonId.ms, function, emphasis: Emphasis.zero),
        ],
        [
          DefaultButton(ButtonId.squareRoot, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.power, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.c, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.ac, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.delete, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(ButtonId.seven, function),
          DefaultButton(ButtonId.eight, function),
          DefaultButton(ButtonId.nine, function),
          DefaultButton(ButtonId.openParentheses, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.closeParentheses, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(ButtonId.four, function),
          DefaultButton(ButtonId.five, function),
          DefaultButton(ButtonId.six, function),
          DefaultButton(ButtonId.multiply, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.divide, function, emphasis: Emphasis.low),
        ],
        [
          DefaultButton(ButtonId.one, function),
          DefaultButton(ButtonId.two, function),
          DefaultButton(ButtonId.three, function),
          DefaultButton(ButtonId.add, function, emphasis: Emphasis.low),
          DefaultButton(ButtonId.subtract, function, emphasis: Emphasis.low),
        ],
        [
          //const DebugButton(),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context!);
              },
              child: const Text('pop'),
            ),
          ),
          DefaultButton(ButtonId.zero, function),
          DefaultButton(ButtonId.dot, function),
          DefaultButton(
            ButtonId.equal,
            function,
            flex: 2,
            emphasis: Emphasis.high,
          ),
        ],
      ];

  static List<List<Widget>> bmiKeyboard(Function function) => [
        [
          DefaultButton(ButtonId.c, function, emphasis: Emphasis.zero),
          DefaultButton(ButtonId.ac, function, emphasis: Emphasis.zero),
          DefaultButton(ButtonId.delete, function, emphasis: Emphasis.zero),
        ],
        [
          DefaultButton(ButtonId.seven, function),
          DefaultButton(ButtonId.eight, function),
          DefaultButton(ButtonId.nine, function),
        ],
        [
          DefaultButton(ButtonId.four, function),
          DefaultButton(ButtonId.five, function),
          DefaultButton(ButtonId.six, function),
        ],
        [
          DefaultButton(ButtonId.one, function),
          DefaultButton(ButtonId.two, function),
          DefaultButton(ButtonId.three, function),
        ],
        [
          const Spacer(),
          DefaultButton(ButtonId.zero, function),
          DefaultButton(
            ButtonId.go,
            function,
            emphasis: Emphasis.high,
          )
        ],
      ];
}
