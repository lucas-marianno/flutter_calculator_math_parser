import 'package:flutter/material.dart';
import 'package:math_expression_parser/routes.dart';

class AppletSelection extends StatefulWidget {
  const AppletSelection({super.key});

  @override
  State<AppletSelection> createState() => _AppletSelectionState();
}

class _AppletSelectionState extends State<AppletSelection> {
  @override
  Widget build(BuildContext context) {
    // TODO: replace with a gridview of the various pages with icons to navigate to
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Pages.currencyConverter);
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Icon(Icons.currency_exchange, size: 80)),
                SizedBox(
                  height: 20,
                  child: FittedBox(child: Text('Currency Converter')),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Pages.bmiPage);
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Icon(Icons.monitor_weight, size: 80)),
                SizedBox(
                  height: 20,
                  child: FittedBox(child: Text('BMI Calculator')),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Pages.aboutPage);
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Icon(Icons.info, size: 80)),
                SizedBox(
                  height: 20,
                  child: FittedBox(child: Text('About this App')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
