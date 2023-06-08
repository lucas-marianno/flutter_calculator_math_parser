import 'package:flutter/material.dart';
import 'package:math_expression_parser/pages/about_page.dart';
import 'package:math_expression_parser/pages/bmi_page.dart';
import 'package:math_expression_parser/pages/calculator_page.dart';
import 'package:math_expression_parser/routes.dart';
import 'package:math_expression_parser/theme.dart';

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
      initialRoute: Pages.mainPage,
      routes: routes,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calculate)),
              Tab(icon: Icon(Icons.monitor_weight)),
              Tab(icon: Icon(Icons.info_outline)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomePage(),
            BMIPage(),
            AboutPage(),
          ],
        ),
      ),
    );
  }
}
