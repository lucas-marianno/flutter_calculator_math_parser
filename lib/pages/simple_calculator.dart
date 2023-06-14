import 'package:flutter/material.dart';

import '../brain/logic.dart';
import '../brain/memory.dart';
import '../widgets/calculator_display.dart';
import '../widgets/keyboard_builder.dart';
import '../widgets/keyboards.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
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
            NumericKeyboardModular(updateDisplay)
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

class NumericKeyboardModular extends StatelessWidget {
  const NumericKeyboardModular(this.function, {super.key});
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
              children: Keyboards.simpleRowfunc(function),
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
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: Keyboards.simpleOperators(function),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
