String equalButtonPressed(String screenValue){

  return '${calc(screenValue)}';
}

num calc(String s) => num.parse(addSub(multDiv(parentheses(s))));


String parentheses(String s) {
  //goes through a string and executes math operations between parentheses
  //returning a string without any parentheses

  List expr = cleaner(s).split(' ');
  int lastOpndParIndex = 0;
  List result = [];
  
  for (int i = 0; i < expr.length; i++) {
  
    if (expr[i] == '(') {
      lastOpndParIndex = i;
      result.add(expr[i]);
    } else if (expr[i] == ')' && lastOpndParIndex > 0) {
      while (result.last != '(') {
        result.removeLast();
      }
      result.removeLast();
      result
          .add(addSub(multDiv(expr.join().substring(lastOpndParIndex + 1, i))));
      lastOpndParIndex = 0;
      print(result);
    } else {
      result.add(expr[i]);
    }
  }
  
  if (result.join().contains(')')) {
    return parentheses(result.join());
  } else {
    return result.join();
  }
}



String addSub(String expression) {
  //goes through a string and either adds or subtracts the next value
  //returns the sum of all operations
  List expr = cleaner(expression).split(' ');
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
  List expr = cleaner(s).split(' ');
  List result = [];

  for (int i = 0; i < expr.length; i++) {
    if (expr[i] == '*') {
      result.last = (num.parse(result.last) *
              (expr[i + 1] == '-'
                  ? num.parse(expr[i + 2]) * -1
                  : num.parse(expr[i + 1])))
          .toString();
      expr[i + 1] == '-' ? i += 2 : i++;
    } else if (expr[i] == '/') {
      result.last = (num.parse(result.last) /
              (expr[i + 1] == '-'
                  ? num.parse(expr[i + 2]) * -1
                  : num.parse(expr[i + 1])))
          .toString();
      expr[i + 1] == '-' ? i += 2 : i++;
    } else {
      result.add(expr[i]);
    }
  }
  return result.join(' ');
}

String cleaner(String s) {
  //removes all unecessary and/or redundant characters in string
  s[0] == '(' ? s = '0' + s : s;
  s = s.replaceAll(' ', '');
  s = s.replaceAll('()', '');
  s = s.replaceAll('--', '+');
  s = s.replaceAll('-+ ', '-');
  s = s.replaceAll('+-', '-');

  String isolated_ = '';

  s.split('').forEach((char) {
    '0123456789.'.contains(char) ? isolated_ += char : isolated_ += ' ${char} ';
  });
  isolated_ = isolated_.replaceAll('  ', ' ').trim();

  return isolated_;
}


void test() {
  var tests = [
    ["1 + 1", 2],
    ["8/16", 0.5],
    ["3 -(-1)", 4],
    ["2 + -2", 0],
    ["10- 2- -5", 13],
    ["(((10)))", 10],
    ["3 * 5", 15],
    ["-7 * -(6 / 3)", 14]
  ];

  for (int j = 0; j < tests.length; j++) {
    print(
        "${tests[j]} = ${(calc(tests[j][0] as String) == tests[j][1] as num ? true : false)}");
  }
}

