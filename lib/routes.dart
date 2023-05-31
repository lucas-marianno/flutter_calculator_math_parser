import 'package:calculator2/screens/about_page.dart';
import 'package:calculator2/screens/bmi_page.dart';
import 'package:calculator2/screens/home_page.dart';
import 'package:flutter/material.dart';

String homeScreen = '/calculatorPage';
String aboutScreen = '/aboutPage';
String bmiScreen = '/bmiScreen';

Map<String, Widget Function(BuildContext)> routes = {
  homeScreen: (context) => const HomePage(),
  aboutScreen: (context) => const AboutPage(),
  bmiScreen: (context) => const BMIPage(),
};
