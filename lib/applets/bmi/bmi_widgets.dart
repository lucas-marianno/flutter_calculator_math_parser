import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bmi_brain.dart';
import '../../constants.dart';

class BMICategoryInfo extends StatelessWidget {
  const BMICategoryInfo({
    required this.label,
    required this.color,
    super.key,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FittedBox(child: Text(label)),
          const Text(''),
          Container(
            height: 3,
            color: color,
          ),
        ],
      ),
    );
  }
}

class BMIDisplay extends StatelessWidget {
  final int weight;
  final int height;
  final MeasurementType selectedMeasurement;
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
            BMIDisplayLine(MeasurementType.weight, weight, selectedMeasurement, screenToggler),
            BMIDisplayLine(MeasurementType.height, height, selectedMeasurement, screenToggler),
          ],
        ),
      ),
    );
  }
}

class BMIDisplayLine extends StatelessWidget {
  final MeasurementType type;
  final int value;
  final MeasurementType selectedMeasurement;
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
    Color screenColor =
        selectedMeasurement == type ? kBMIActiveScreenColor : kBMIInactiveScreenColor;

    if (type == MeasurementType.weight) {
      measurementType = 'Weight';
      measurmentUnity = 'Kilograms';
    } else {
      measurementType = 'Height';
      measurmentUnity = 'Centimeters';
    }

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                Expanded(
                  child: FittedBox(
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        color: screenColor,
                        //fontSize: kKeyTextSize * 2,
                      ),
                    ),
                  ),
                ),
                Text(measurmentUnity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BMIResultsContent extends StatelessWidget {
  const BMIResultsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // this might not be the best solution to limit column height
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Information'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BMICategoryInfo(
                label: kUnderweightLabel,
                color: kUnderweightColor,
              ),
              BMICategoryInfo(
                label: kNormalWeightLabel,
                color: kNormalWeightColor,
              ),
              BMICategoryInfo(
                label: kOverweightLabel,
                color: kOverweightColor,
              ),
              BMICategoryInfo(
                label: kObeseLabel,
                color: kObeseColor,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('16.0'),
              Text('18.5'),
              Text('25.0'),
              Text('30.0'),
              Text('40.0'),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: 'Learn more about BMI categories '),
                TextSpan(
                  text: 'here',
                  style: kHyperlinkTextStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchUrl(
                        Uri.parse('https://en.wikipedia.org/wiki/Body_mass_index'),
                        mode: LaunchMode.externalApplication),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BMIResultsTitle extends StatelessWidget {
  const BMIResultsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  BMIBrain.getBMI().toStringAsFixed(2),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FittedBox(child: Text('     BMI     ')),
                  FittedBox(
                    child: Text(
                      BMIBrain.getTitleCategory(),
                      style: TextStyle(
                        color: BMIBrain.getTitleColor(),
                        letterSpacing: kLetterSpacing,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}
