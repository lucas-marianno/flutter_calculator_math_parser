import 'package:flutter/material.dart';
import 'package:calculator2/constants.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    required this.screenValue,
  });

  final String screenValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(kScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CalculatorMemoryDisplay(),
            CalculatorMainDisplay(screenValue: screenValue),
          ],
        ),
      ),
    );
  }
}

class CalculatorMemoryDisplay extends StatelessWidget {
  const CalculatorMemoryDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //TODO: this is where the memory screen will go
        child: Placeholder(),
      ),
    );
  }
}

class CalculatorMainDisplay extends StatelessWidget {
  const CalculatorMainDisplay({
    super.key,
    required this.screenValue,
  });

  final String screenValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        alignment: Alignment.bottomRight,
        fit: BoxFit.contain,
        child: Text(
          screenValue,
          style: kCalulatorMainDisplayTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// TODO: after implementing the memory screen, use this to store the memory values

// class MemoryScreen {
//   final Widget currentMemoryValue;
//   final Function updateMemoryScreen;
//
//   const MemoryScreen(this.currentMemoryValue, this.updateMemoryScreen);
//
//   static Widget memoryValue() {
//     return const Expanded(child: Text(''));
//   }
//
//   static Widget addMemoryEntry(String entry) {
//     return Expanded(
//       child: FittedBox(
//         fit: BoxFit.contain,
//         alignment: Alignment.bottomRight,
//         child: GestureDetector(
//             onTap: () {
//               print(entry.split(' = ')[0].runtimeType);
//             },
//             child: Text(entry, style: kMemEntryTextStyle)),
//       ),
//     );
//   }
// }
//
// class MemoryEntry extends StatelessWidget {
//   // TODO: Implement a gesture detector AND function that replaces the value on screen by its value
//   final String entry;
//   const MemoryEntry(this.entry, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: FittedBox(
//         fit: BoxFit.contain,
//         alignment: Alignment.bottomRight,
//         child: GestureDetector(
//             onTap: () {
//               print(entry.split(' = ')[0]);
//             },
//             child: Text(entry, style: kMemEntryTextStyle)),
//       ),
//     );
//   }
// }
