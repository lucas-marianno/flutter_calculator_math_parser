import 'package:calculator2/widgets/buttons.dart';
import 'package:calculator2/widgets/screen.dart';

import 'package:flutter/material.dart';
import 'equal_logic.dart';

String lastBtnPressed = '';
List<Widget> mathHistory = [];
num memory = 0;

class Logic {
  final String buttonId;
  final String currentScreen;

  Logic(this.buttonId, this.currentScreen);

  static String newScreenValue(String buttonId, String currentScreen) {
    if ((lastBtnPressed == ButtonId.equal || lastBtnPressed == ButtonId.ms) &&
        '0123456789.'.contains(buttonId)) {
      currentScreen = '0';
    }

    lastBtnPressed = buttonId;

    // equal pressed
    if (buttonId == ButtonId.equal) {
      mathHistory
          .add(MemoryEntry(currentScreen, calculateMathExpr(currentScreen)));
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
    } else if (buttonId == ButtonId.ms) {
      lastBtnPressed = ButtonId.ms;
      memory = num.parse(calculateMathExpr(currentScreen));
      return currentScreen;
    } else if (buttonId == ButtonId.mr) {
      return currentScreen + memory.toString();
      // no math screen
    } else if (currentScreen != '0' &&
        (buttonId == ButtonId.squareRoot) &&
        !currentScreen.contains(
            RegExp('[*-+${ButtonId.divide}${ButtonId.squareRoot}]'))) {
      // sqrt pressed
      if (buttonId == ButtonId.squareRoot) {
        return currentScreen == '0' ? buttonId : buttonId + currentScreen;
        // round up pressed
      } else if (buttonId == ButtonId.rndUp) {
        return num.parse(currentScreen).ceil().toString();
        // round down pressed
      } else if (buttonId == ButtonId.rndDown) {
        return num.parse(currentScreen).floor().toString();
      }
      // this should never return
      return '?';
    } else {
      // round up pressed
      if (buttonId == ButtonId.rndUp) {
        return num.parse(calculateMathExpr(currentScreen)).ceil().toString();
        // round down pressed
      } else if (buttonId == ButtonId.rndDown) {
        return num.parse(calculateMathExpr(currentScreen)).floor().toString();
      }

      return currentScreen == '0' ? buttonId : currentScreen + buttonId;
    }
  }

  static Widget newMemoryScreenValue() {
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
