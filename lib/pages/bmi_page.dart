import 'package:flutter/material.dart';
import '../brain/bmi_brain.dart';
import '../brain/logic.dart';
import '../widgets/keyboard_builder.dart';
import '../widgets/keyboard_default_button.dart';
import '../widgets/keyboards.dart';
import '../widgets/popupmenu.dart';
import '../widgets/bmi_widgets.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  // TODO: Feature: implement a way to select imperial or metric measurements

  BMIMeasurementType _selectedDisplay = BMIMeasurementType.weight;
  int selectedDisplayValue = 0;

  _updateBMIScreen(buttonId) {
    setState(() {
      selectedDisplayValue = _selectedDisplay == BMIMeasurementType.weight
          ? BMIBrain.getWeight()
          : BMIBrain.getHeight();

      if (buttonId == ButtonId.ac) {
        BMIBrain.clear();
      } else if (buttonId == ButtonId.equal) {
        BMIBrain.setBMI();
        BMIBrain.displayResults(context);
      }
      String newvalue =
          Logic.newScreenValue(buttonId, selectedDisplayValue.toString());

      if (_selectedDisplay == BMIMeasurementType.weight) {
        BMIBrain.setWeight(int.parse(newvalue));
      } else {
        BMIBrain.setHeight(int.parse(newvalue));
      }
    });
  }

  _toggleSelectedScreen(BMIMeasurementType type) {
    setState(() {
      _selectedDisplay = type;
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
              _selectedDisplay, _toggleSelectedScreen),
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
