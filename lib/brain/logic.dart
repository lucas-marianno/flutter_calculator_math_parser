import 'package:calculator2/widgets/buttons.dart';
import 'package:calculator2/widgets/screen.dart';

import 'package:flutter/material.dart';
import 'equal_logic.dart';

String previousButtonId = '';
List<Widget> mathHistory = [
  const Text(' '),
  const Text(' '),
  const Text(' '),
  const Text(' '),
  const Text(' '),
];
num memory = 0;

class Logic {
  final String buttonId;
  final String currentScreen;

  Logic(this.buttonId, this.currentScreen);

  static String newScreenValue(String buttonId, String currentScreen) {
    currentScreen = removeEqualSignFromScreen(currentScreen);

    // if the last button pressed was '=' or 'ms' AND the current button is a
    // num, it will clear the currentScreen.
    if ((previousButtonId == ButtonId.equal ||
            previousButtonId == ButtonId.ms) &&
        '0123456789.'.contains(buttonId)) {
      currentScreen = '0';
    }

    previousButtonId = buttonId;

    // EQUAL pressed
    if (buttonId == ButtonId.equal) {
      mathHistory.add(MemoryEntry(currentScreen));
      return calculateMathExpr(currentScreen);
      // C pressed
    } else if (buttonId == ButtonId.c) {
      return '0';
      // AC pressed
    } else if (buttonId == ButtonId.ac) {
      memory = 0;
      mathHistory = [];
      return '0';
      // DEL pressed
    } else if (buttonId == ButtonId.delete) {
      if (currentScreen.length <= 1) return currentScreen;
      return currentScreen.substring(0, currentScreen.length - 1);
      // MS Pressed
    } else if (buttonId == ButtonId.ms) {
      previousButtonId = ButtonId.ms;
      memory = num.parse(
          removeEqualSignFromScreen(calculateMathExpr(currentScreen)));
      return currentScreen;
      // MR Pressed
    } else if (buttonId == ButtonId.mr) {
      if (currentScreen == memory.toString()) return currentScreen;
      if (memory == 0) return currentScreen;
      // TODO: evaluate if the screen ends with a symbol, otherwise it should clear the screen first
      if (currentScreen == '0') return memory.toString();
      return currentScreen + memory.toString();
      // no math screen
    } else if (currentScreen != '0' &&
        (buttonId == ButtonId.squareRoot) &&
        !currentScreen.contains(
            RegExp('[*-+${ButtonId.divide}${ButtonId.squareRoot}]'))) {
      // sqrt pressed
      if (buttonId == ButtonId.squareRoot) {
        return currentScreen == '0' ? buttonId : buttonId + currentScreen;
      }
      // this should never return
      return '?';
    }
    return currentScreen == '0' ? buttonId : currentScreen + buttonId;
  }

  static Widget newMemoryScreenValue() {
    // Defines the lenght of memory that appears on display (limits to 6 entries)
    if (mathHistory.length > 6) {
      mathHistory = mathHistory.sublist(1);
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: mathHistory,
      ),
    );
  }
}

String removeEqualSignFromScreen(String s) {
  // if the first character is '=', removes the first and second character ' '.
  return s[0] == '=' ? s = s.substring(2) : s;
}
