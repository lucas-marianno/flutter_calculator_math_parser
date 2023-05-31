import 'package:calculator2/routes.dart';
import 'package:calculator2/widgets/keyboard_builder.dart';
import 'package:calculator2/widgets/keyboards.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  @override
  Widget build(BuildContext context) {
    //TODO: implement the BMI screen
    updateBMIScreen(buttonId) => setState(() {});

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, homeScreen);
          },
          child: const Text('BMI'),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          const Divider(),
          KeyboardBuilder(
            firstRowShorter: true,
            keyboard: bmiKeyboard(updateBMIScreen),
          ),
        ],
      ),
    );
  }
}
