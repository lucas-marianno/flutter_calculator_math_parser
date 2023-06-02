import 'package:calculator2/brain/memory.dart';
import 'package:calculator2/constants.dart';
import 'package:calculator2/widgets/keyboard_builder.dart';
import 'package:flutter/material.dart';
import '../brain/logic.dart';
import '../widgets/calculator_display.dart';
import '../widgets/popupmenu.dart';
import '../widgets/keyboards.dart';

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
              keyboard: calculatorKeyboard(updateDisplay),
            ),
          ],
        ),
      ),
    );
  }
}
