import 'package:flutter/material.dart';
import '../brain/logic.dart';
import '../brain/memory.dart';
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
              mainDisplayValue: Memory.getDisplayValue(),
            ),
            const Divider(),
            FullKeyboardModular(updateDisplay)
            // KeyboardBuilder(
            //   firstRowShorter: true,
            //   keyboard: Keyboards.calculatorKeyboard(updateDisplay, context: context),
            // ),
          ],
        ),
      ),
    );
  }
}

class FullKeyboardModular extends StatelessWidget {
  const FullKeyboardModular(this.function, {super.key});
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: Keyboards.mem(function),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: Keyboards.rowfunc(function),
            ),
          ),
          Expanded(
            flex: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Hero(
                    tag: 'numeric',
                    child: KeyboardBuilder(
                      keyboard: Keyboards.numericKeyboard(function, context: context),
                    ),
                  ),
                ),
                KeyboardBuilder(flex: 2, keyboard: Keyboards.operators(function))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
