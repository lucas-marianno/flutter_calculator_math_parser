import 'package:calculator2/widgets/keyboard_default_button.dart';
import 'package:calculator2/widgets/keyboard_builder.dart';
import 'package:calculator2/widgets/keyboards.dart';
import 'package:flutter/material.dart';
import '../brain/bmi_brain.dart';
import '../brain/logic.dart';
import '../widgets/popupmenu.dart';
import '../widgets/bmi_widgets.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  // TODO: Feature: implement a way to select imperial or metric measurements

  BMIMeasurementType _selectedScreen = BMIMeasurementType.weight;

  _updateBMIScreen(buttonId) {
    setState(() {
      int _height = BMIBrain.getHeight();
      int _weight = BMIBrain.getWeight();
      if (buttonId == ButtonId.ac) {
        BMIBrain.clear();
      } else if (buttonId == ButtonId.equal) {
        BMIBrain.setBMI(_height, _weight);
        BMIBrain.displayResults(context);
      } else if (_selectedScreen == BMIMeasurementType.weight) {
        BMIBrain.setWeight('$_weight'.length < 3
            ? int.parse(Logic.newScreenValue(buttonId, _weight.toString()))
            : _weight);
      } else {
        BMIBrain.setHeight('$_height'.length < 3
            ? int.parse(Logic.newScreenValue(buttonId, _height.toString()))
            : _height);
      }
    });
  }

  _toggleSelectedScreen(BMIMeasurementType type) {
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
          BMIDisplay(BMIBrain.getWeight(), BMIBrain.getHeight(),
              _selectedScreen, _toggleSelectedScreen),
          const Divider(),
          KeyboardBuilder(
            firstRowShorter: true,
            keyboard: Keyboards.bmiKeyboard(_updateBMIScreen),
          ),
        ],
      ),
    );
  }
}
