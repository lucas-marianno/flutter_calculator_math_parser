import 'package:flutter/material.dart';
import '../routes.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => Navigator.popAndPushNamed(context, value),
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
