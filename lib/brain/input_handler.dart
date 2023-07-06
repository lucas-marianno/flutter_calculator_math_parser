import '../constants.dart';
import '../applets/calculator/math_expression_parser.dart';
import 'memory.dart';

class InputHandler {
  static String removeEqualSignFromExpr(String s) {
    // if the first character is '=', removes the first and second character ' '.
    return s[0] == '=' ? s = s.substring(2) : s;
  }

  static String newDisplayValue(String buttonId, String currentDisplay) {
    String previousButtonId = Memory.getPreviousButtonId();
    num memory = Memory.getMemoryValue();
    currentDisplay = removeEqualSignFromExpr(currentDisplay);

    Memory.setPreviousButtonId(buttonId);

    switch (buttonId) {
      case ButtonId.go:
        return removeEqualSignFromExpr(Parser.evaluateExpression(currentDisplay));
      case ButtonId.equal:
        Memory.addToMathHistory('$currentDisplay ${Parser.evaluateExpression(
          currentDisplay,
        )}');
        return Parser.evaluateExpression(
          currentDisplay,
        );
      case ButtonId.c:
        return '0';
      case ButtonId.ac:
        Memory.clear();
        return '0';
      case ButtonId.delete:
        if (currentDisplay.length <= 1) return '0';
        return currentDisplay.substring(0, currentDisplay.length - 1);
      case ButtonId.ms:
        Memory.setMemoryValue(
          num.parse(
            removeEqualSignFromExpr(
              Parser.evaluateExpression(
                currentDisplay,
              ),
            ),
          ),
        );
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
        final bool isDisplayZero = currentDisplay == '0';
        final bool displayContainsOperators = currentDisplay.contains(
          RegExp('[*-+${ButtonId.divide}${ButtonId.squareRoot}]'),
        );
        if (!isDisplayZero && !displayContainsOperators) {
          return buttonId + currentDisplay;
        } else if (isDisplayZero) {
          return buttonId;
        }
        return currentDisplay + buttonId;
      case ButtonId.power:
        return currentDisplay + buttonId + ButtonId.openParentheses;
      default:
        final bool isPreviousButtonEqualOrMS =
            (previousButtonId == ButtonId.equal || previousButtonId == ButtonId.ms);
        if (isPreviousButtonEqualOrMS && '01234567890.'.contains(buttonId)) {
          currentDisplay = '0';
        }
        if (currentDisplay.length <= kCurrentDisplayLimit) {
          // TODO: Feature: Replace display character limit by a scrollable screen
          // Limits the currentDisplay to kCurrentDisplayLimit characters
          return currentDisplay == '0' ? buttonId : currentDisplay + buttonId;
        } else {
          return currentDisplay;
        }
    }
  }
}
