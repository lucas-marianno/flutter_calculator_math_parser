import 'package:flutter/material.dart';
import 'buttons.dart';

List<List<Widget>> calculatorKeyboard(Function function) => [
      [
        DefaultButton(ButtonId.mr, function, emphasis: Emphasis.zero),
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
        DefaultButton(ButtonId.openParentheses, function,
            emphasis: Emphasis.low),
        DefaultButton(ButtonId.closeParentheses, function,
            emphasis: Emphasis.low),
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
        Expanded(child: Container()),
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

List<List<Widget>> bmiKeyboard(Function function) => [
      [
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
        DefaultButton(ButtonId.dot, function),
        DefaultButton(ButtonId.zero, function),
        DefaultButton(
          ButtonId.equal,
          function,
          emphasis: Emphasis.high,
        ),
      ],
    ];
