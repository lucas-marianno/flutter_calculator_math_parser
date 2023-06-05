import 'package:calculator2/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/bmi_widgets.dart';

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

  static void setHeight(int h) {
    String value = h.toString();
    // Limits the display to 3 characters
    value = value.length > 3 ? value.substring(0, 3) : value;
    _height = int.parse(value);
  }

  static void setWeight(int w) {
    String value = w.toString();
    // Limits the display to 3 characters
    value = value.length > 3 ? value.substring(0, 3) : value;
    _weight = int.parse(value);
  }

  static void displayResults(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const BMIResultsTitle(),
        content: const BMIResultsContent(),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              BMIBrain.clear();
            },
            child: const Text('Recalculate'),
          ),
        ],
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
  static int _weight = 0;
  static int _height = 0;
}
