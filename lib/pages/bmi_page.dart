import 'package:flutter/material.dart';
import '../brain/bmi_brain.dart';
import '../brain/logic.dart';
import '../constants.dart';
import '../widgets/keyboard_builder.dart';
import '../widgets/keyboards.dart';
import '../widgets/bmi_widgets.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  // TODO: Feature: implement a way to select imperial or metric measurements

  MeasurementType _selectedDisplay = MeasurementType.weight;
  int selectedDisplayValue = 0;

  _updateBMIScreen(buttonId) {
    setState(() {
      selectedDisplayValue =
          _selectedDisplay == MeasurementType.weight ? BMIBrain.getWeight() : BMIBrain.getHeight();

      if (buttonId == ButtonId.ac) {
        BMIBrain.clear();
      } else if (buttonId == ButtonId.go) {
        BMIBrain.setBMI();
        BMIBrain.displayResults(context);
      } else {
        String displayValue = Logic.newDisplayValue(buttonId, selectedDisplayValue.toString());

        if (_selectedDisplay == MeasurementType.weight) {
          BMIBrain.setWeight(int.parse(displayValue));
        } else {
          BMIBrain.setHeight(int.parse(displayValue));
        }
      }
    });
  }

  _toggleSelectedScreen(MeasurementType type) {
    setState(() {
      _selectedDisplay = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BMIDisplay(
              BMIBrain.getWeight(), BMIBrain.getHeight(), _selectedDisplay, _toggleSelectedScreen),
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
