import 'package:calculator2/routes.dart';
import 'package:calculator2/theme.dart';
import 'package:flutter/material.dart';

// TODO: Update the readme.md file and add new screen captures on the github page
// TODO: Upgrade to Material3

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Uncomment this to run the app in fullscreen mode (full restart required):
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: calculatorPage,
      routes: routes,
    );
  }
}
