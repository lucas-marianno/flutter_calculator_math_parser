import 'package:flutter/material.dart';
import 'package:math_expression_parser/routes.dart';
import 'package:math_expression_parser/widgets/applet_selection_button.dart';

class AppletSelection extends StatefulWidget {
  const AppletSelection({super.key});

  @override
  State<AppletSelection> createState() => _AppletSelectionState();
}

class _AppletSelectionState extends State<AppletSelection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: const [
          AppletSelectionButton(
            title: 'Currency Converter',
            icon: Icons.currency_exchange,
            navigateTo: Pages.currencyConverter,
          ),
          AppletSelectionButton(
            title: 'BMI Calculator',
            icon: Icons.monitor_weight,
            navigateTo: Pages.bmiPage,
          ),
          AppletSelectionButton(
            title: 'About this App',
            icon: Icons.info,
            navigateTo: Pages.aboutPage,
          ),
          AppletSelectionButton(
            title: 'Need help?',
            icon: Icons.help,
            navigateTo: Pages.helpPage,
          ),
        ],
      ),
    );
  }
}
