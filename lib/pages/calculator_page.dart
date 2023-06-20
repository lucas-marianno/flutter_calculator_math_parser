import 'package:flutter/material.dart';
import '../brain/logic.dart';
import '../brain/memory.dart';
import '../constants.dart';
import '../widgets/calculator_display.dart';
import '../widgets/keyboard_builder.dart';
import '../widgets/keyboards.dart';

// TODO: Feature: Implement the hability to select text on any of the app displays, and copy it.
// TODO: Feature: Implement a cursor on any of the displays, allowing users to edit text.

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  updateDisplay(buttonId) {
    setState(() {
      Memory.setFunction(updateDisplayFromMemory);
      Memory.setDisplayValue(Logic.newDisplayValue(buttonId, Memory.getDisplayValue()));
    });
  }

  updateDisplayFromMemory(newDisplayValue) {
    setState(() {
      Memory.setDisplayValue(newDisplayValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CalculatorDisplay(
              memoryDisplayValue: Memory.getMathHistory(),
              mainDisplayValue: beautify(Memory.getDisplayValue()),
            ),
            const Divider(),
            KeyboardBuilder(
              firstRowShorter: true,
              keyboard: Keyboards.calculatorKeyboard(updateDisplay, context: context),
            ),
          ],
        ),
      ),
    );
  }
}

String beautify(String s) {
  return s;
  // TODO: reactivate this after implementing auto parentheses
  // String ans = '';
  // bool isSuperScript = false;

  // for (int i = 0; i < s.length; i++) {
  //   if (s[i] == ButtonId.power) {
  //     isSuperScript = isSuperScript ? false : true;
  //   } else {
  //     ans += isSuperScript ? _toSuperScript(s[i]) : s[i];
  //   }
  // }

  // return ans;
}

String _toSuperScript(String n) {
  String ans = '';
  n.split('').forEach((e) {
    if (kToSuperScript.containsKey(e)) {
      ans += kToSuperScript[e]!;
    } else {
      ans += e;
    }
  });

  return ans;
}

String _removeSuperScript(String n) {
  print(n);
  String ans = '';
  n.split('').forEach((e) {
    if (kFromSuperScript.containsKey(e)) {
      ans += kFromSuperScript[e]!;
    } else {
      ans += e;
    }
  });
  print(ans);
  return ans;
}
