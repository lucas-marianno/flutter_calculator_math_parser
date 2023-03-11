import 'package:calculator2/buttons.dart';
import 'package:calculator2/screen.dart';

import 'package:flutter/material.dart';
import 'equal_logic.dart';

String lastBtnPressed = '';

class Logic {
  final String buttonId;
  final String currentScreen;

  Logic(this.buttonId, this.currentScreen);

  static String newScreenValue(String buttonId, String currentScreen) {
    if (lastBtnPressed == ButtonId.equal && '0123456789.'.contains(buttonId)) {
      currentScreen = '0';
    }

    lastBtnPressed = buttonId;

    //if (currentScreen == expressionError) buttonId = ButtonId.c;

    if (buttonId == ButtonId.equal) {
      memory.add(MemoryEntry(currentScreen, calculateMathExpr(currentScreen)));
      return calculateMathExpr(currentScreen);
    } else if (buttonId == ButtonId.c) {
      return '0';
    } else if (buttonId == ButtonId.ac) {
      memory = [];
      return '0';
    } else if (buttonId == ButtonId.delete) {
      if (currentScreen.length <= 1) return currentScreen;
      return currentScreen.substring(0, currentScreen.length - 1);
    } else if (buttonId == ButtonId.squareRoot &&
        !currentScreen.contains(
            RegExp('[*-+${ButtonId.divide}${ButtonId.squareRoot}]'))) {
      return currentScreen == '0' ? buttonId : buttonId + currentScreen;
    } else {
      return currentScreen == '0' ? buttonId : currentScreen + buttonId;
    }
  }

  static Widget newMemoryScreenValue() {
    if (memory.length > 6) {
      memory = memory.sublist(1);
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: memory,
      ),
    );
  }
}

List<Widget> memory = [];
