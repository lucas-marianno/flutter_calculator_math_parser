import 'package:calculator2/buttons.dart';

class Logic {
  final String buttonId;
  final String currentScreen;

  Logic(this.buttonId, this.currentScreen);

  static String newScreenValue(buttonId, currentScreen) {
    if (buttonId == ButtonId.equal) {
      return equalTest(currentScreen);
    } else if (buttonId == ButtonId.ce || buttonId == ButtonId.ac) {
      return '0';
    } else if (buttonId == ButtonId.delete) {
      if (currentScreen.length <= 1) return currentScreen;

      var temp = currentScreen.split('');
      temp.removeLast();
      return temp.join();
    } else if ('0123456789+-*/()DEL'.contains(buttonId)) {
      currentScreen == '0' ? currentScreen = '' : null;
      return currentScreen + buttonId;
    } else {
      return 'work in progress';
    }
  }
}

equalTest(String expression) {
  expression = expression.replaceAll(" ", "");
  while (expression.contains("(")) {
    String sub = expression.substring(0,expression.indexOf(")"));
    sub = sub.substring(sub.lastIndexOf("(")+1);
    expression = expression.replaceAll("($sub)", '${engine(sub)}');
  }

  if(engine(expression)- engine(expression).toInt() == 0){
    return engine(expression).toInt();
  }

  return engine(expression);
}

double engine(String str) {
  str = str.replaceAll("--", "+").replaceAll("+-", "-");
  str += "+";
  String number = str[0];
  String operator1 = "", operator2 = "";
  double number1 = 0, number2 = 0;

  for (int b = 1; b <= str.length; b++) {
    if (!"-+*/".contains(str[b])) {
      number += str[b];
    } else {
      double number3 = double.parse(number);
      
      if (operator2 == "") {
        number2 = number3;
      } else {
        operator2 == "*" ? number2 *= number3 : number2 /= number3;
      }

      if (str[b] == "+" || str[b] == "-") {
        if (operator1 == "") {
          number1 = number2;
        } else {
          operator1 == "+" ? number1 += number2 : number1 -= number2;
        }
        operator1 = str[b];
        operator2 = "";
      } else {
        operator2 = str[b];
      }
      b++;

      if (b < str.length) number = str[b];
    }
  }
  return number1;
}