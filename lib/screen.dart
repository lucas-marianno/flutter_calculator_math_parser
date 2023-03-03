import 'package:flutter/material.dart';
import 'color_palette.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Palette.dark(),
      child: SizedBox(
        width: 500,
        height: 300,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '0123456789',
            style: displayTextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
