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
        elevation: 5,
        shadowColor: Colors.black,
        color: Palette.dark,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '01234567890',
            style: displayTextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}