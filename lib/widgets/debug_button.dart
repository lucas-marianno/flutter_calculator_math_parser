import 'package:flutter/material.dart';
import '../brain/debug.dart';
import '../constants.dart';

class DebugButton extends StatelessWidget {
  const DebugButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      return Expanded(
        child: TextButton(
          onPressed: () => Debug.debugCalculator(),
          child: const FittedBox(
            child: Text('debug'),
          ),
        ),
      );
    } else {
      return const Spacer();
    }
  }
}
