// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: avoid_print

import 'debug.dart';
import 'package:math_expression_parser/constants.dart';

void main() {
  // TODO: Learn more about testing and replace the function values for simulated taps and gestures on screen.
  if (kDebugMode) {
    Debug.debugCalculator();
    superscriptTest();
  } else {
    print('kDebugMode == false');
  }
}

superscriptTest() {
  kToSuperScript.entries;
  for (MapEntry entry in kToSuperScript.entries) {
    print('${kToSuperScript[entry.key]}  =  ${kFromSuperScript[kToSuperScript[entry.key]]}');
  }
}
