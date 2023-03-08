import 'package:calculator2/buttons.dart';
import 'equal_logic.dart';

String lastBtnPressed = '';

class Logic {
  final String buttonId;
  final String currentScreen;

  Logic(this.buttonId, this.currentScreen);

  

  static String newScreenValue(buttonId, currentScreen) {
    if(lastBtnPressed == ButtonId.equal && '0123456789.'.contains(buttonId)) {
      currentScreen = '0';
    }
    lastBtnPressed = buttonId;

    if(currentScreen == 'invalid expression') buttonId = ButtonId.c;

    if (buttonId == ButtonId.equal) {
      
      return calculateMathExpr(currentScreen);
    } else if (buttonId == ButtonId.c || buttonId == ButtonId.ac) {
      return '0';
    } else if (buttonId == ButtonId.delete) {
      if (currentScreen.length <= 1) return currentScreen;

      var temp = currentScreen.split('');
      temp.removeLast();
      return temp.join();
    } else if ('0123456789.+-*/()DEL'.contains(buttonId)) {
      currentScreen == '0' ? currentScreen = '' : null;
      return currentScreen + buttonId;
    } else {
      return 'work in progress';
    }
  }
}
