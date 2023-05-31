import 'package:flutter/material.dart';
import 'buttons.dart';

List<List<Widget>> calculatorKeyboard(Function function) => [
      [
        DefaultButton(ButtonId.mr, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.ms, function, emphasis: Emphasis.low),
      ],
      [
        DefaultButton(ButtonId.squareRoot, function, emphasis: Emphasis.medium),
        DefaultButton(ButtonId.power, function, emphasis: Emphasis.medium),
        DefaultButton(ButtonId.c, function, emphasis: Emphasis.medium),
        DefaultButton(ButtonId.ac, function, emphasis: Emphasis.medium),
        DefaultButton(ButtonId.delete, function, emphasis: Emphasis.medium),
      ],
      [
        DefaultButton(ButtonId.seven, function),
        DefaultButton(ButtonId.eight, function),
        DefaultButton(ButtonId.nine, function),
        DefaultButton(ButtonId.openParentheses, function,
            emphasis: Emphasis.medium),
        DefaultButton(ButtonId.closeParentheses, function,
            emphasis: Emphasis.medium),
      ],
      [
        DefaultButton(ButtonId.four, function),
        DefaultButton(ButtonId.five, function),
        DefaultButton(ButtonId.six, function),
        DefaultButton(ButtonId.multiply, function, emphasis: Emphasis.medium),
        DefaultButton(ButtonId.divide, function, emphasis: Emphasis.medium),
      ],
      [
        DefaultButton(ButtonId.one, function),
        DefaultButton(ButtonId.two, function),
        DefaultButton(ButtonId.three, function),
        DefaultButton(ButtonId.add, function, emphasis: Emphasis.medium),
        DefaultButton(ButtonId.subtract, function, emphasis: Emphasis.medium),
      ],
      [
        Expanded(child: Container()),
        DefaultButton(ButtonId.zero, function),
        DefaultButton(ButtonId.dot, function),
        DefaultButton(
          ButtonId.equal,
          function,
          flex: 2,
          emphasis: Emphasis.max,
        ),
      ],
    ];

List<List<Widget>> bmiKeyboard(Function function) => [
      [
        DefaultButton(ButtonId.ac, function, emphasis: Emphasis.low),
        DefaultButton(ButtonId.delete, function, emphasis: Emphasis.low),
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
          emphasis: Emphasis.max,
        ),
      ],
    ];
