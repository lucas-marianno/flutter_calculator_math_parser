import 'package:flutter/material.dart';
import '../constants.dart';

class Screen extends StatelessWidget {
  final String screenValue;
  final Widget memoryValue;
  const Screen(this.screenValue, this.memoryValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            memoryValue,
            Expanded(
              child: FittedBox(
                alignment: Alignment.bottomRight,
                fit: BoxFit.contain,
                child: Text(
                  screenValue,
                  style: kDisplayTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MemoryEntry extends StatelessWidget {
  final String entry;
  //final String result;
  const MemoryEntry(this.entry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.bottomRight,
        child: Text(entry, style: kMemEntryTextStyle),
      ),
    );
  }
}
