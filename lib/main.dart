import 'package:flutter/material.dart';
import 'package:math_expression_parser/applets/currency/currency_favorites.dart';
import 'package:math_expression_parser/applets/currency/exchange_rates_getter.dart';
import 'package:math_expression_parser/routes.dart';
import 'package:math_expression_parser/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSharedPreferences();
  await exchangeRates.initializeExchangeRates();
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: material2themeData,
      initialRoute: Pages.mainPage,
      routes: routes,
    );
  }
}
