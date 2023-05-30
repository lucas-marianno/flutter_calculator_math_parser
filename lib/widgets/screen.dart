import 'package:flutter/material.dart';
import '../constants.dart';

class Screen extends StatefulWidget {
  final String screenValue;
  final Widget memoryValue;
  const Screen(this.screenValue, this.memoryValue, {super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 10,
        shadowColor: kShadowColor,
        color: kScreenBackground,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              widget.memoryValue,
              Expanded(
                child: FittedBox(
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.contain,
                  child: Text(
                    widget.screenValue,
                    style: kDisplayTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MemoryEntry extends StatelessWidget {
  final String entry;
  final String result;
  const MemoryEntry(this.entry, this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.bottomRight,
        child: Text(
          '$entry=$result',
          style: kDisplayTextStyle,
        ),
      ),
    );
  }
}