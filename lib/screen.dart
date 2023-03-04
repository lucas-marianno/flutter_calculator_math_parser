import 'package:flutter/material.dart';
import 'style.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  String clickedButton = '';
  String screenText = 'button clicked = ';

  callback(buttonId){
    setState(() {
      clickedButton = buttonId;
    });
  }

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
              screenText + clickedButton,
              style: displayTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}