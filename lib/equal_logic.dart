
String calculateMathExpr(String s){
  
  s.contains(RegExp(s));


  return parentheses(s);
  }

String expressionError = 'invalid expression';

String parentheses(String s) {
  if (!s.contains('(')) return addSub(multDiv(s));
  int prths = 0;
  String tempS = '';

  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(' || s[i] == ')') {
      if (s[i] == ')')
        prths--;
      else {
        prths++;
        if (i > 0 && isNum(s[i - 1])) tempS += '*';
      }
    }
    tempS += s[i];
  }

  if (prths != 0) return expressionError;

  s = tempS;

  int lastOpenPar = s.lastIndexOf('(') + 1;
  int firstClosePar = s.substring(lastOpenPar).indexOf(')');
  String betweenPar = s.substring(lastOpenPar, firstClosePar + lastOpenPar);

  s = s.replaceAll('($betweenPar)', '${addSub(multDiv(betweenPar))}');
  if (s.contains('(')) {
    s = parentheses(s);
  }

  return addSub(multDiv(s));
}

bool isNum(String s) => '0123456789'.contains(s);

String addSub(String expression) {
  //goes through a string and either adds or subtracts the next value
  //returns the sum of all operations
  List expr = cleaner(expression);
  num result = 0;

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == '+') {
      result += num.parse(expr[i + 1]);
    } else if (expr[i] == '-') {
      result -= num.parse(expr[i + 1]);
    } else if (i == 0) {
      result += num.parse(expr[i]);
    }
  }

  return result.toString();
}

String multDiv(String s) {
  //goes through a string and executes all multiplications and divisions within it
  //while preserving all other symbols such as parentheses and/or sum/sub
  List expr = cleaner(s);
  List result = [];

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == '*' || expr[i] == '/') {
      num tempNum = expr[i + 1] == '-'
          ? num.parse(expr[i + 2]) * -1
          : num.parse(expr[i + 1]);

      if (expr[i] == '/') {
        result.last = (num.parse(result.last) / tempNum).toString();
      } else {
        result.last = (num.parse(result.last) * tempNum).toString();
      }
      if (num.parse(result.last) - num.parse(result.last).toInt() == 0) {
        result.last = num.parse(result.last).toInt().toString();
      }
      expr[i + 1] == '-' ? i += 2 : i++;
    } else {
      result.add(expr[i]);
    }
  }
  return result.join(' ');
}

List cleaner(String s) {
  //removes all unecessary and/or redundant characters in string
  //returns a list with all separated elements
  s[0] == '(' ? s = '0+' + s : s;
  s = s
      .replaceAll(' ', '')
      .replaceAll('()', '')
      .replaceAll('--', '+')
      .replaceAll('-+ ', '-')
      .replaceAll('+-', '-')
      .split('')
      .map((e) => e = '0123456789.'.contains(e) ? e : ' ${e} ')
      .join();

  return s.replaceAll('  ', ' ').trim().split(' ');
}