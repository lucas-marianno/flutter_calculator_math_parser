import 'package:calculator2/routes.dart';
import 'package:calculator2/widgets/keyboard_layout.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, homeScreen);
            },
            child: const Text('BMI'),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          const Divider(),
          Keyboard(() {}),
        ],
      ),
    );
  }
}
