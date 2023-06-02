import 'package:calculator2/brain/memory.dart';
import 'package:flutter/material.dart';
import 'package:calculator2/constants.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    required this.mainDisplayValue,
    required this.memoryDisplayValue,
    super.key,
  });
  final List<Widget> memoryDisplayValue;
  final String mainDisplayValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(kScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CalculatorMemoryDisplay(memoryDisplayValue),
            CalculatorMainDisplay(mainDisplayValue),
          ],
        ),
      ),
    );
  }
}

class CalculatorMainDisplay extends StatelessWidget {
  const CalculatorMainDisplay(this.mainDisplayValue, {super.key});

  final String mainDisplayValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        alignment: Alignment.bottomRight,
        fit: BoxFit.contain,
        child: Text(
          mainDisplayValue,
          style: kCalulatorMainDisplayTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CalculatorMemoryDisplay extends StatelessWidget {
  const CalculatorMemoryDisplay(this.memoryDisplayValue, {super.key});

  final List<Widget> memoryDisplayValue;

  @override
  Widget build(BuildContext context) {
    //TODO: this is where the memory screen will go
    return Expanded(
      child: FittedBox(
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: Memory.getMathHistory(),
        ),
      ),
    );
  }
}

class CalculatorMemoryEntry extends StatelessWidget {
  const CalculatorMemoryEntry(this.entry, this.setStateFunction, {super.key});
  final String entry;
  final Function setStateFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setStateFunction(entry.split(' = ')[0]),
      child: Text(
        entry,
        style: kMemEntryTextStyle,
      ),
    );
  }
}
