import 'package:flutter/material.dart';
import 'package:math_expression_parser/main.dart';
import 'package:math_expression_parser/pages/about_page.dart';
import 'package:math_expression_parser/pages/applet_selection_page.dart';
import 'package:math_expression_parser/applets/bmi/bmi_page.dart';
import 'package:math_expression_parser/applets/calculator/calculator_page.dart';
import 'applets/currency/loading_screen.dart';

class Pages {
  static const String mainPage = '/main',
      calculatorPage = '/calculatorPage',
      aboutPage = '/aboutPage',
      bmiPage = '/bmiScreen',
      currencyConverter = '/currencyConverter',
      appletSelection = '/applet';
}

Map<String, Widget Function(BuildContext)> routes = {
  Pages.mainPage: (context) => const MainPage(),
  Pages.calculatorPage: (context) => const CalculatorPage(),
  Pages.aboutPage: (context) => const AboutPage(),
  Pages.bmiPage: (context) => const BMIPage(),
  Pages.currencyConverter: (context) => const CurrencyConverterLoading(),
  Pages.appletSelection: (context) => const AppletSelection(),
};
