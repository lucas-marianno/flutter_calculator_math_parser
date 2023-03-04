import 'package:flutter/material.dart';
import 'style.dart';

class Screen extends StatefulWidget {
  final String screenValue;
  const Screen(this.screenValue, {super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  @override
  Widget build(BuildContext context) {
    //return Text(widget.screenValue);
    return Expanded(
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        color: Palette.screenBackground,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: Text('')),
              const Expanded(child: Text('')),
              Expanded(
                flex: 2,
                child: FittedBox(
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.contain,
                  child: Text(
                    widget.screenValue,
                    style: displayTextStyle(),
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