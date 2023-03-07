import 'logic.dart';

void main() {
  test();
}

void test() {
  var tests = [
    ["(81)", 81],
    ['12*(25+1)', 312],
    ['2(1+2)', 6],
    ["1 + 1", 2],
    ["8/16", 0.5],
    ["3 -(-1)", 4],
    ["2 + -2", 0],
    ["10- 2- -5", 13],
    ["(((10)))", 10],
    ["3 * 5", 15],
    ["-7 * -(6 / 3)", 14],
    ['50+2*3', 56],
    ['(50+2)*3', 156]
  ];

  for (List ls in tests) {
    if (equalButtonPressed(ls[0]) == '${ls[1]}') {
      print('testing for ${ls[0]} - \x1B[32mPASS\x1B[0m');
    } else {
      print('testing for ${ls[0]} - \x1B[31mFAILED\x1B[0m');
      print('expected ${ls[1]} - got ${equalButtonPressed(ls[0])}');
    }
  }
}

bool errorFinder(String s){

  int nOfOpenParentheses = 0;
  int nOfClosedParentheses = 0;

  s.split('').forEach((element) {
    if(element == '(') nOfOpenParentheses++;
    if(element == ')') nOfClosedParentheses++;
  });

  if(s.contains('//')) return false;
  if(s.contains('**')) return false;
  if(s.contains('+++')) return false;
  if(s.contains('---')) return false;

  if(nOfOpenParentheses != nOfClosedParentheses) return false;

  return true;
}


String equalButtonPressed(String screenValue) {
  if(!errorFinder(screenValue)) return 'invalid expression';
  return '${equalTest(screenValue)}';
}

num calc(String s) => num.parse(addSub(multDiv(parentheses(s))));

String parentheses(String s) {
  //goes through a string and executes math operations between parentheses
  //returning a string without any parentheses

  while(s.contains('(')){
    String temp = s.substring(0,s.indexOf(')'));
    temp = temp.substring(temp.indexOf('(')+1);
    s = s.replaceAll('($temp)', equalButtonPressed(s));
  }


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
      result.last = (num.parse(result.last) * (expr[i + 1] == '-' ? num.parse(expr[i + 2]) * -1 : num.parse(expr[i + 1]))).toString();
      expr[i + 1] == '-' ? i += 2 : i++;
    } else if (expr[i] == '/') {
      result.last = (num.parse(result.last) / (expr[i + 1] == '-' ? num.parse(expr[i + 2]) * -1 : num.parse(expr[i + 1]))).toString();
      //removes the decimal part of the number, if possible
      if(num.parse(result.last) - num.parse(result.last).toInt() == 0){
        result.last = num.parse(result.last).toInt().toString();
      }
      expr[i + 1] == '-' ? i += 2 : i++;
    } else {
      result.add(expr[i]);
    }
  }
  return result.join(' ');
}

String cleaner(String s) {
  //removes all unecessary and/or redundant characters in string
  s[0] == '(' ? s = '0$s' : s;
  s.replaceAll(' ', '')
    .replaceAll('()', '')
    .replaceAll('--', '+')
    .replaceAll('-+ ', '-')
    .replaceAll('+-', '-');

  String isolated_ = '';

  s.split('').forEach((char) {
    '0123456789.'.contains(char) ? isolated_ += char : isolated_ += ' $char ';
  });
  isolated_ = isolated_.replaceAll('  ', ' ').trim();

  return isolated_;
}
