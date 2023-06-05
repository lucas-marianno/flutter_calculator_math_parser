import 'package:calculator2/widgets/keyboard_default_button.dart';
import '../constants.dart';
import 'equal_logic.dart';
import 'memory.dart';

class Logic {
  static String newScreenValue(String buttonId, String currentDisplay) {
    String previousButtonId = Memory.getPreviousButtonId();
    num memory = Memory.getMemoryValue();

    currentDisplay = removeEqualSignFromExpr(currentDisplay);

    // if the last button pressed was '=' or 'ms' AND the current button is a
    // num, it will clear the currentScreen.
    if ((previousButtonId == ButtonId.equal ||
            previousButtonId == ButtonId.ms) &&
        '0123456789.'.contains(buttonId)) {
      currentDisplay = '0';
    }
    // if currentDisplay is invalid, clears it.
    if (!isValidExpression(currentDisplay)) currentDisplay = '0';

    // stores the current buttonId to previous previousButtonId.
    previousButtonId = buttonId;

    switch (buttonId) {
      case ButtonId.equal:
        Memory.addToMathHistory(
            '$currentDisplay ${calculateMathExpr(currentDisplay)}');
        return calculateMathExpr(currentDisplay);
      case ButtonId.c:
        return '0';
      case ButtonId.ac:
        Memory.clear();
        return '0';
      case ButtonId.delete:
        if (currentDisplay.length <= 1) return '0';
        return currentDisplay.substring(0, currentDisplay.length - 1);
      case ButtonId.ms:
        previousButtonId = ButtonId.ms;
        Memory.setMemoryValue(num.parse(
            removeEqualSignFromExpr(calculateMathExpr(currentDisplay))));
        return currentDisplay;
      case ButtonId.mc:
        Memory.setMemoryValue(0);
        return currentDisplay;
      case ButtonId.mr:
        if (currentDisplay == memory.toString()) return currentDisplay;
        if (currentDisplay == '0') return memory.toString();
        // if the currentDisplay ends with a digit, replaces its value with memory
        if (currentDisplay.contains(RegExp(r'\d$'))) return memory.toString();
        return currentDisplay + memory.toString();
      case ButtonId.squareRoot:
        // If the display is zero AND there's only digits on display, inserts
        // sqrt before the current display.
        if (currentDisplay != '0' &&
            !currentDisplay.contains(
              RegExp('[*-+${ButtonId.divide}${ButtonId.squareRoot}]'),
            )) {
          return buttonId + currentDisplay;
        }
        return currentDisplay + buttonId;
      default:
        // else: inserts buttonId after currentDisplay
        if (currentDisplay.length <= kCurrentDisplayLimit) {
          // Limits the currentDisplay to kCurrentDisplayLimit characters
          return currentDisplay == '0' ? buttonId : currentDisplay + buttonId;
        } else {
          return currentDisplay;
        }
    }
  }
}
