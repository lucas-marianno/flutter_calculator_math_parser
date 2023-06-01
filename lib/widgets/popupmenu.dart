import 'package:flutter/material.dart';
import '../routes.dart';

class PopupMenu extends StatelessWidget {
  // TODO: Replace this widget by a top navigation bar.
  const PopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == aboutPage) {
          Navigator.pushNamed(context, value);
        } else {
          Navigator.popAndPushNamed(context, value);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: calculatorPage, child: const Text('Calculator')),
        PopupMenuItem(value: bmiPage, child: const Text('BMI Calculator')),
        PopupMenuItem(
          value: aboutPage,
          child: const Row(
            children: [Text('About  '), Icon(Icons.info_outline)],
          ),
        ),
      ],
    );
  }
}
