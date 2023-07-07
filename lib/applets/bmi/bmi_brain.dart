import 'package:flutter/material.dart';
import '../../constants.dart';
import 'bmi_widgets.dart';

class BMIBrain {
  static void clear() {
    _height = 0;
    _weight = 0;
  }

  static void setBMI() {
    if (_weight != 0 && _height != 0) {
      double h2 = _height / 100;
      _bmi = _weight / (h2 * h2);
    } else {
      _bmi = 0;
    }
  }

  static void setHeightWeight(int n, MeasurementType measurementType) {
    String value = n.toString();
    // Limits the display to 3 characters
    value = value.length > 3 ? value.substring(0, 3) : value;

    if (measurementType == MeasurementType.height) {
      _height = int.parse(value);
    } else if (measurementType == MeasurementType.weight) {
      _weight = int.parse(value);
    }
  }

  static void displayResults(context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: BMIResultsTitle(),
        content: BMIResultsContent(),
      ),
    );
  }

  static double getBMI() => _bmi;
  static int getHeight() => _height;
  static int getWeight() => _weight;

  static Color getTitleColor() {
    if (_bmi < 18.5) return kUnderweightColor;
    if (_bmi < 25.0) return kNormalWeightColor;
    if (_bmi < 30.0) return kOverweightColor;
    return kObeseColor;
  }

  static String getTitleCategory() {
    if (_bmi < 18.5) return kUnderweightLabel;
    if (_bmi < 25.0) return kNormalWeightLabel;
    if (_bmi < 30.0) return kOverweightLabel;
    return kObeseLabel;
  }

  static double _bmi = 0;
  static int _weight = 70;
  static int _height = 170;
}
