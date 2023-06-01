import 'package:flutter/material.dart';
import '../constants.dart';

enum BMIScreenLineType { weight, height }

class BMIScreen extends StatelessWidget {
  final int weight;
  final int height;
  final BMIScreenLineType selectedScreen;
  final Function screenToggler;

  const BMIScreen(
    this.weight,
    this.height,
    this.selectedScreen,
    this.screenToggler, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kScreenPadding * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BMIScreenLine(BMIScreenLineType.weight, weight, selectedScreen,
                screenToggler),
            BMIScreenLine(BMIScreenLineType.height, height, selectedScreen,
                screenToggler),
          ],
        ),
      ),
    );
  }
}

class BMIScreenLine extends StatelessWidget {
  final BMIScreenLineType type;
  final int value;
  final BMIScreenLineType selectedScreen;
  final Function screenToggler;
  const BMIScreenLine(
    this.type,
    this.value,
    this.selectedScreen,
    this.screenToggler, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String measurementType = '';
    String measurmentUnity = '';
    Color screenColor = selectedScreen == type
        ? kBMIActiveScreenColor
        : kBMIInactiveScreenColor;

    if (type == BMIScreenLineType.weight) {
      measurementType = 'Weight';
      measurmentUnity = 'Kilograms';
    } else {
      measurementType = 'Height';
      measurmentUnity = 'Centimeters';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          //TODO: implement a dropdown menu to choose kg/lb | cm/ftin
          children: [
            Text(
              measurementType,
              style: kBMIScreenTextStyle,
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
        GestureDetector(
          onTap: () => screenToggler(type),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value.toString(),
                style:
                    TextStyle(color: screenColor, fontSize: kKeyTextSize * 2),
              ),
              Text(measurmentUnity),
            ],
          ),
        ),
      ],
    );
  }
}
