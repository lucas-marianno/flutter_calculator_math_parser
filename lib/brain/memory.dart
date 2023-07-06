import 'package:flutter/material.dart';
import '../applets/calculator/calculator_display.dart';

class Memory {
  static String getDisplayValue() => _displayValue;
  static Function getFunction() => _calculatorSetState;
  static List<Widget> getMathHistory() => _mathHistory;
  static num getMemoryValue() => _memory;
  static String getPreviousButtonId() => _previousButtonId;

  static void addToMathHistory(String mathExpressionAndResult) {
    _mathHistory.length >= 6 ? _mathHistory.removeAt(0) : null;
    _mathHistory.add(CalculatorMemoryEntry(mathExpressionAndResult, _calculatorSetState));
  }

  static void clear() {
    _previousButtonId = '';
    _memory = 0;
    _mathHistory = [];
    _displayValue = '0';
  }

  static void setDisplayValue(String newDisplayValue) {
    _displayValue = newDisplayValue;
  }

  static void setFunction(Function setStateFunction) {
    _calculatorSetState = setStateFunction;
  }

  static void setMemoryValue(num newMemoryValue) {
    _memory = newMemoryValue;
  }

  static void setPreviousButtonId(String buttonId) {
    _previousButtonId = buttonId;
  }

  static Function _calculatorSetState = () {};
  static String _displayValue = '0';
  static List<Widget> _mathHistory = [];
  static num _memory = 0;
  static String _previousButtonId = '';
}
