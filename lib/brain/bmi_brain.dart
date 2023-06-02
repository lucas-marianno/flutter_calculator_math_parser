import 'package:calculator2/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/bmi_widgets.dart';

class BMIBrain {
  static void clear() {
    _height = 0;
    _weight = 0;
  }

  static void setBMI(int h, int w) {
    if (w != 0 && h != 0) {
      double h2 = h / 100;
      _bmi = w / (h2 * h2);
    } else {
      _bmi = 0;
    }
  }

  static void setHeight(int h) {
    _height = h;
  }

  static void setWeight(int w) {
    _weight = w;
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
