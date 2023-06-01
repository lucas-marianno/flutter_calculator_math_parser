import 'package:calculator2/routes.dart';
import 'package:calculator2/widgets/buttons.dart';
import 'package:calculator2/widgets/keyboard_builder.dart';
import 'package:calculator2/widgets/keyboards.dart';
import 'package:flutter/material.dart';
import '../brain/bmi_calculator.dart';
import '../brain/logic.dart';
import '../widgets/popupmenu.dart';
import '../widgets/screens.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  // TODO: implement a way to select imperial or metric measurements
  int _weight = 0;
  int _height = 0;
  BMIScreenLineType _selectedScreen = BMIScreenLineType.weight;

  _updateBMIScreen(buttonId) {
    setState(() {
      if (buttonId == ButtonId.ac) {
        _height = 0;
        _weight = 0;
      } else if (buttonId == ButtonId.equal) {
        //TODO: create a function that displays the bmi result in a alert
        BMICalculator.setBMI(_height, _weight);
        Navigator.pushNamed(context, bmiResultsPage);
        _height = 0;
        _weight = 0;
      } else if (_selectedScreen == BMIScreenLineType.weight) {
        _weight = '$_weight'.length < 3
            ? int.parse(Logic.newScreenValue(buttonId, _weight.toString()))
            : _weight;
      } else {
        _height = '$_height'.length < 3
            ? int.parse(Logic.newScreenValue(buttonId, _height.toString()))
            : _height;
      }
    });
  }

  _toggleSelectedScreen(BMIScreenLineType type) {
    setState(() {
      _selectedScreen = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI'),
        actions: const [PopupMenu()],
      ),
      body: Column(
        children: [
          BMIScreen(_weight, _height, _selectedScreen, _toggleSelectedScreen),
          const Divider(),
          KeyboardBuilder(
            firstRowShorter: true,
            keyboard: bmiKeyboard(_updateBMIScreen),
          ),
        ],
      ),
    );
  }
}
