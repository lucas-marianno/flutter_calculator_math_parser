import 'package:calculator2/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../brain/bmi_calculator.dart';

class BMIResultsPage extends StatelessWidget {
  const BMIResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(flex: 3),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kDefaultButtonColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BMIResults(),
                    BMIResultsInformation(),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(flex: 3),
          Expanded(
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(kHighEmphasisButtonColor),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('RE-CALCULATE'),
            ),
          )
        ],
      ),
    );
  }
}

class BMIResults extends StatelessWidget {
  const BMIResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                BMICalculator.getBMI().toStringAsFixed(2),
                style: kBigBoldTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: kGap),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('BMI', style: kBoldTextStyle),
                  Text(
                    BMICalculator.category(),
                    style: TextStyle(
                      color: BMICalculator.titleColor(),
                      fontSize: kKeyTextSize,
                      letterSpacing: kLetterSpacing,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

class BMIResultsInformation extends StatelessWidget {
  const BMIResultsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Information'),
          Row(
            children: [
              Expanded(child: Container(height: 3)),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text('Underweight'),
                    const Text(''),
                    Container(
                      height: 3,
                      color: kUnderweight,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text('Normal'),
                    const Text(''),
                    Container(height: 3, color: kNormalWeight),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text('Overweight'),
                    const Text(''),
                    Container(height: 3, color: kOverweight),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text('Obese'),
                    const Text(''),
                    Container(height: 3, color: kObese),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(height: 3),
                  ],
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Uri.parse(
                            'https://en.wikipedia.org/wiki/Body_mass_index'),
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
