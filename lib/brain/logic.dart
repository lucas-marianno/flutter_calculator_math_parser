import 'package:calculator2/widgets/buttons.dart';
import 'equal_logic.dart';
import 'memory.dart';

class Logic {
  static String newScreenValue(String buttonId, String currentScreen) {
    String previousButtonId = Memory.getPreviousButtonId();
    num memory = Memory.getMemoryValue();

    currentScreen = removeEqualSignFromScreen(currentScreen);

    // if the last button pressed was '=' or 'ms' AND the current button is a
    // num, it will clear the currentScreen.
    if ((previousButtonId == ButtonId.equal ||
            previousButtonId == ButtonId.ms) &&
        '0123456789.'.contains(buttonId)) {
      currentScreen = '0';
    }

    previousButtonId = buttonId;
    // TODO: this sequence of 'if statements' is confuse and verbose. This should be rewritten and abstracted into separate functions

    // EQUAL pressed
    if (buttonId == ButtonId.equal) {
      Memory.addToMathHistory(
          '$currentScreen ${calculateMathExpr(currentScreen)}');
      return calculateMathExpr(currentScreen);
      // C pressed
    } else if (buttonId == ButtonId.c) {
      return '0';
      // AC pressed
    } else if (buttonId == ButtonId.ac) {
      Memory.clear();
      return '0';
      // DEL pressed
    } else if (buttonId == ButtonId.delete) {
      if (currentScreen.length <= 1) return '0';
      return currentScreen.substring(0, currentScreen.length - 1);
      // MS Pressed
    } else if (buttonId == ButtonId.ms) {
      previousButtonId = ButtonId.ms;
      Memory.setMemoryValue(num.parse(
          removeEqualSignFromScreen(calculateMathExpr(currentScreen))));

      return currentScreen;
      // MR Pressed
    } else if (buttonId == ButtonId.mr) {
      if (currentScreen == memory.toString()) return currentScreen;
      if (memory == 0) return currentScreen;
      // TODO: evaluate if the screen ends with a symbol, otherwise it should clear the screen first
      if (currentScreen == '0') return memory.toString();
      return currentScreen + memory.toString();
      // MC pressed
    } else if (buttonId == ButtonId.mc) {
      Memory.setMemoryValue(0);
      return currentScreen;
      // Screen doesn't contain any math to be calculated
    } else if (currentScreen != '0' &&
        buttonId == ButtonId.squareRoot &&
        !currentScreen.contains(
          RegExp('[*-+${ButtonId.divide}${ButtonId.squareRoot}]'),
        )) {
      // sqrt pressed
      if (buttonId == ButtonId.squareRoot) {
        return currentScreen == '0' ? buttonId : buttonId + currentScreen;
      }
      // this should never return
      return '?';
    }
    return currentScreen == '0' ? buttonId : currentScreen + buttonId;
  }
}

String removeEqualSignFromScreen(String s) {
  // if the first character is '=', removes the first and second character ' '.
  return s[0] == '=' ? s = s.substring(2) : s;
}
