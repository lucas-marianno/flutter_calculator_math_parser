import 'package:calculator2/widgets/buttons.dart';
import '../constants.dart';
import 'equal_logic.dart';
import 'memory.dart';

class Logic {
  static String newScreenValue(String buttonId, String currentDisplay) {
    String previousButtonId = Memory.getPreviousButtonId();
    num memory = Memory.getMemoryValue();

    currentDisplay = removeEqualSignFromScreen(currentDisplay);

    // if the last button pressed was '=' or 'ms' AND the current button is a
    // num, it will clear the currentScreen.
    if ((previousButtonId == ButtonId.equal ||
            previousButtonId == ButtonId.ms) &&
        '0123456789.'.contains(buttonId)) {
      currentDisplay = '0';
    }

    previousButtonId = buttonId;
    // TODO: this sequence of 'if statements' is confuse and verbose. This should be rewritten and abstracted into separate functions

    // EQUAL pressed
    if (buttonId == ButtonId.equal) {
      Memory.addToMathHistory(
          '$currentDisplay ${calculateMathExpr(currentDisplay)}');
      return calculateMathExpr(currentDisplay);
      // C pressed
    } else if (buttonId == ButtonId.c) {
      return '0';
      // AC pressed
    } else if (buttonId == ButtonId.ac) {
      Memory.clear();
      return '0';
      // DEL pressed
    } else if (buttonId == ButtonId.delete) {
      if (currentDisplay.length <= 1) return '0';
      return currentDisplay.substring(0, currentDisplay.length - 1);
      // MS Pressed
    } else if (buttonId == ButtonId.ms) {
      previousButtonId = ButtonId.ms;
      Memory.setMemoryValue(num.parse(
          removeEqualSignFromScreen(calculateMathExpr(currentDisplay))));

      return currentDisplay;
      // MR Pressed
    } else if (buttonId == ButtonId.mr) {
      if (currentDisplay == memory.toString()) return currentDisplay;
      if (memory == 0) return currentDisplay;
      // TODO: evaluate if the screen ends with a symbol, otherwise it should clear the screen first
      if (currentDisplay == '0') return memory.toString();
      return currentDisplay + memory.toString();
      // MC pressed
    } else if (buttonId == ButtonId.mc) {
      Memory.setMemoryValue(0);
      return currentDisplay;
      // Screen doesn't contain any math to be calculated
    } else if (currentDisplay != '0' &&
        buttonId == ButtonId.squareRoot &&
        !currentDisplay.contains(
          RegExp('[*-+${ButtonId.divide}${ButtonId.squareRoot}]'),
        )) {
      // sqrt pressed
      if (buttonId == ButtonId.squareRoot) {
        return currentDisplay == '0' ? buttonId : buttonId + currentDisplay;
      }
      // this should never return
      return '?';
    } else if (currentDisplay.length <= kCurrentDisplayLimit) {
      // Limits the currentDisplay to kCurrentDisplayLimit characters
      return currentDisplay == '0' ? buttonId : currentDisplay + buttonId;
    } else {
      return currentDisplay;
    }
  }
}

String removeEqualSignFromScreen(String s) {
  // if the first character is '=', removes the first and second character ' '.
  return s[0] == '=' ? s = s.substring(2) : s;
}
