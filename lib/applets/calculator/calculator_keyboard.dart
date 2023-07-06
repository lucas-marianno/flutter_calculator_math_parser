import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/keyboard_default_button.dart';

List<List<Widget>> calculatorKeyboard(Function function, {BuildContext? context}) => [
      [
        DefaultKeyboardButton(ButtonId.mr, function, emphasis: Emphasis.zero),
        DefaultKeyboardButton(ButtonId.mc, function, emphasis: Emphasis.zero),
        DefaultKeyboardButton(ButtonId.ms, function, emphasis: Emphasis.zero),
      ],
      [
        DefaultKeyboardButton(ButtonId.squareRoot, function, emphasis: Emphasis.low),
        DefaultKeyboardButton(ButtonId.power, function, emphasis: Emphasis.low),
        DefaultKeyboardButton(ButtonId.c, function, emphasis: Emphasis.low),
        DefaultKeyboardButton(ButtonId.ac, function, emphasis: Emphasis.low),
        DefaultKeyboardButton(ButtonId.delete, function, emphasis: Emphasis.low),
      ],
      [
        DefaultKeyboardButton(ButtonId.seven, function),
        DefaultKeyboardButton(ButtonId.eight, function),
        DefaultKeyboardButton(ButtonId.nine, function),
        DefaultKeyboardButton(ButtonId.openParentheses, function, emphasis: Emphasis.low),
        DefaultKeyboardButton(ButtonId.closeParentheses, function, emphasis: Emphasis.low),
      ],
      [
        DefaultKeyboardButton(ButtonId.four, function),
        DefaultKeyboardButton(ButtonId.five, function),
        DefaultKeyboardButton(ButtonId.six, function),
        DefaultKeyboardButton(ButtonId.multiply, function, emphasis: Emphasis.low),
        DefaultKeyboardButton(ButtonId.divide, function, emphasis: Emphasis.low),
      ],
      [
        DefaultKeyboardButton(ButtonId.one, function),
        DefaultKeyboardButton(ButtonId.two, function),
        DefaultKeyboardButton(ButtonId.three, function),
        DefaultKeyboardButton(ButtonId.add, function, emphasis: Emphasis.low),
        DefaultKeyboardButton(ButtonId.subtract, function, emphasis: Emphasis.low),
      ],
      [
        const Spacer(),
        DefaultKeyboardButton(ButtonId.zero, function),
        DefaultKeyboardButton(ButtonId.dot, function),
        DefaultKeyboardButton(
          ButtonId.equal,
          function,
          flex: 2,
          emphasis: Emphasis.high,
        ),
      ],
    ];
