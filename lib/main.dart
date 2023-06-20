import 'package:flutter/material.dart';
import 'package:math_expression_parser/constants.dart';
import 'package:math_expression_parser/pages/bmi_page.dart';
import 'package:math_expression_parser/pages/calculator_page.dart';
import 'package:math_expression_parser/routes.dart';
import 'package:math_expression_parser/theme.dart';
import 'package:math_expression_parser/widgets/popupmenu.dart';

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
      theme: material2themeData,
      initialRoute: Pages.mainPage,
      routes: routes,
      // home: const SandboxPage(),
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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            isScrollable: false,
            indicatorColor: kHighEmphasisButtonColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: kHighEmphasisButtonColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.calculate)),
              Tab(icon: Icon(Icons.monitor_weight)),
            ],
          ),
          actions: const [PopupMenu()],
        ),
        body: const TabBarView(
          children: [
            CalculatorPage(),
            BMIPage(),
          ],
        ),
      ),
    );
  }
}
