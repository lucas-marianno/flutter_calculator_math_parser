import 'package:flutter/material.dart';
import '../brain/logic.dart';
import '../brain/memory.dart';
import '../constants.dart';
import '../widgets/calculator_display.dart';
import '../widgets/keyboard_builder.dart';
import '../widgets/popupmenu.dart';
import '../widgets/keyboards.dart';

// TODO: Feature: Implement the hability to select text on any of the app displays, and copy it.
// TODO: Feature: Implement a cursor on any of the displays, allowing users to edit text.

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  updateDisplay(buttonId) {
    setState(() {
      Memory.setFunction(updateDisplayFromMemory);
      Memory.setDisplayValue(
          Logic.newScreenValue(buttonId, Memory.getDisplayValue()));
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
        appBar: AppBar(
            centerTitle: true,
            title: const Text('CALCULATOR'),
            actions: const [PopupMenu()]),
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            CalculatorDisplay(
              memoryDisplayValue: Memory.getMathHistory(),
              mainDisplayValue: Memory.getDisplayValue(),
            ),
            const Divider(),
            KeyboardBuilder(
              firstRowShorter: true,
              keyboard: Keyboards.calculatorKeyboard(updateDisplay),
            ),
          ],
        ),
      ),
    );
  }
}
