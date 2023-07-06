import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/keyboard_default_button.dart';

List<List<Widget>> bmiKeyboard(Function function) => [
      [
        DefaultKeyboardButton(ButtonId.c, function, emphasis: Emphasis.zero),
        DefaultKeyboardButton(ButtonId.ac, function, emphasis: Emphasis.zero),
        DefaultKeyboardButton(ButtonId.delete, function, emphasis: Emphasis.zero),
      ],
      [
        DefaultKeyboardButton(ButtonId.seven, function),
        DefaultKeyboardButton(ButtonId.eight, function),
        DefaultKeyboardButton(ButtonId.nine, function),
      ],
      [
        DefaultKeyboardButton(ButtonId.four, function),
        DefaultKeyboardButton(ButtonId.five, function),
        DefaultKeyboardButton(ButtonId.six, function),
      ],
      [
        DefaultKeyboardButton(ButtonId.one, function),
        DefaultKeyboardButton(ButtonId.two, function),
        DefaultKeyboardButton(ButtonId.three, function),
      ],
      [
        const Spacer(),
        DefaultKeyboardButton(ButtonId.zero, function),
        DefaultKeyboardButton(
          ButtonId.go,
          function,
          emphasis: Emphasis.high,
        )
      ],
    ];
