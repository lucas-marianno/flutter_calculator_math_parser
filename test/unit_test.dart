import 'package:flutter_test/flutter_test.dart';
import 'package:math_expression_parser/brain/logic.dart';
import 'package:math_expression_parser/brain/math_expression_parser.dart';
import 'package:math_expression_parser/constants.dart';

import 'debug.dart';

void main() {
  group('Testing Parser', () {
    Debug.allTests.forEach((key, value) {
      test('Testing for $key', () {
        key = key.replaceAll('/', ButtonId.divide);
        key = key.replaceAll('¬', ButtonId.squareRoot);
        String ans = Logic.removeEqualSignFromExpr(Parser.evaluateExpression(key));

        expect(ans, value);
      });
    });
  });
}
