import 'package:flutter/material.dart';
import 'package:math_expression_parser/main.dart';
import 'package:math_expression_parser/pages/about_page.dart';
import 'package:math_expression_parser/pages/bmi_page.dart';
import 'package:math_expression_parser/pages/calculator_page.dart';

class Pages {
  static const String mainPage = '/main',
      calculatorPage = '/calculatorPage',
      aboutPage = '/aboutPage',
      bmiPage = '/bmiScreen';
}

Map<String, Widget Function(BuildContext)> routes = {
  Pages.mainPage: (context) => const MainPage(),
  Pages.calculatorPage: (context) => const CalculatorPage(),
  Pages.aboutPage: (context) => const AboutPage(),
  Pages.bmiPage: (context) => const BMIPage(),
};
