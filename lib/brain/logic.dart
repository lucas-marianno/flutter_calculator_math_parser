import '../constants.dart';
import 'math_expression_parser.dart';
import 'memory.dart';

class Logic extends Parser {
  static String removeEqualSignFromExpr(String s) {
    // if the first character is '=', removes the first and second character ' '.
    return s[0] == '=' ? s = s.substring(2) : s;
  }

  static String parse(String s) => Parser.evaluateExpression(s);

  static String newDisplayValue(String buttonId, String currentDisplay) {
    String previousButtonId = Memory.getPreviousButtonId();
    num memory = Memory.getMemoryValue();

    currentDisplay = removeEqualSignFromExpr(currentDisplay);

    // TODO: feature: after a pow '^' the number should be elevated until an
    // operand or par is pressed

    // stores the current buttonId to previous previousButtonId.
    Memory.setPreviousButtonId(buttonId);

    switch (buttonId) {
      case ButtonId.go:
        return removeEqualSignFromExpr(parse(currentDisplay));
      case ButtonId.equal:
        Memory.addToMathHistory('$currentDisplay ${parse(currentDisplay)}');
        return parse(currentDisplay);
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
            num.parse(removeEqualSignFromExpr(parse(currentDisplay))));
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
        // If the display is NOT zero AND display DOES NOT contain operands, then:
        // inserts sqrt before the current display.
        if (currentDisplay != '0' &&
            !currentDisplay.contains(
              RegExp('[*-+${ButtonId.divide}${ButtonId.squareRoot}]'),
            )) {
          return buttonId + currentDisplay;
        } else if (currentDisplay == '0') {
          return buttonId;
        }
        return currentDisplay + buttonId;
      default:
        if ((previousButtonId == ButtonId.equal ||
                previousButtonId == ButtonId.ms) &&
            '01234567890.'.contains(buttonId)) {
          // if the last button pressed was '=' or 'ms' AND the current button is a
          // num, it will clear the currentDisplay before adding a new digit.
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
