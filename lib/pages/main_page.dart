import 'package:flutter/material.dart';
import 'package:math_expression_parser/applets/calculator/calculator_page.dart';
import 'package:math_expression_parser/constants.dart';
import 'package:math_expression_parser/pages/applet_selection_page.dart';
import 'package:math_expression_parser/widgets/popupmenu.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
              Tab(icon: Icon(Icons.functions)),
            ],
          ),
          actions: const [PopupMenu()],
        ),
        body: const TabBarView(
          children: [
            CalculatorPage(),
            AppletSelection(),
          ],
        ),
      ),
    );
  }
}
