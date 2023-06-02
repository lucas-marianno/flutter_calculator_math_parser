import 'package:flutter/material.dart';
import '../constants.dart';

enum BMIMeasurementType { weight, height }

class BMIDisplay extends StatelessWidget {
  final int weight;
  final int height;
  final BMIMeasurementType selectedMeasurement;
  final Function screenToggler;

  const BMIDisplay(
    this.weight,
    this.height,
    this.selectedMeasurement,
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
            BMIDisplayLine(BMIMeasurementType.weight, weight,
                selectedMeasurement, screenToggler),
            BMIDisplayLine(BMIMeasurementType.height, height,
                selectedMeasurement, screenToggler),
          ],
        ),
      ),
    );
  }
}

class BMIDisplayLine extends StatelessWidget {
  final BMIMeasurementType type;
  final int value;
  final BMIMeasurementType selectedMeasurement;
  final Function screenToggler;
  const BMIDisplayLine(
    this.type,
    this.value,
    this.selectedMeasurement,
    this.screenToggler, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String measurementType = '';
    String measurmentUnity = '';
    Color screenColor = selectedMeasurement == type
        ? kBMIActiveScreenColor
        : kBMIInactiveScreenColor;

    if (type == BMIMeasurementType.weight) {
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
          //TODO: Feature: implement a dropdown menu to choose kg/lb | cm/ftin
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
