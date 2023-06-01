import 'package:calculator2/constants.dart';

class BMICalculator {
  static double _bmi = 0;

  static double getBMI() => _bmi;

  static void setBMI(int height, int weight) {
    if (weight != 0 && height != 0) {
      double h = height / 100;
      _bmi = weight / (h * h);
    } else {
      _bmi = 0;
    }
  }

  static titleColor() {
    if (_bmi < 18.5) return kUnderweight;
    if (_bmi < 25.0) return kNormalWeight;
    if (_bmi < 30.0) return kOverweight;
    return kObese;
  }

  static String category() {
    if (_bmi < 18.5) return 'Underweight';
    if (_bmi < 25.0) return 'Normal';
    if (_bmi < 30.0) return 'Overweight';
    return 'Obese';
  }
}
