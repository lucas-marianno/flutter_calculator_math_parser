import 'package:flutter/material.dart';
import 'style.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        color: Palette.screenBackground,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FittedBox(
            alignment: Alignment.bottomCenter,
            fit: BoxFit.contain,
            child: Text(
              '01234567890',
              style: displayTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}