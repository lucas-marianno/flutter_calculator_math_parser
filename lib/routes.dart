import 'package:calculator2/pages/about_page.dart';
import 'package:calculator2/pages/bmi_page.dart';
import 'package:calculator2/pages/calculator_page.dart';
import 'package:flutter/material.dart';

String calculatorPage = '/calculatorPage';
String aboutPage = '/aboutPage';
String bmiPage = '/bmiScreen';

Map<String, Widget Function(BuildContext)> routes = {
  calculatorPage: (context) => const HomePage(),
  aboutPage: (context) => const AboutPage(),
  bmiPage: (context) => const BMIPage(),
};
