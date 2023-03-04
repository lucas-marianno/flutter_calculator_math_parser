import 'package:flutter/material.dart';
import 'style.dart';

class FunctionButton extends StatelessWidget {
  final String keyText;
  const FunctionButton(this.keyText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: DefaultSizes.defaultKeyPadding),
        child: TextButton(
          style: functionButtonStyle(),
          onPressed: () {},
          child: Text(keyText),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String buttonId;
  final Function buttonFunction;
  const DefaultButton(this.buttonId, this.buttonFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(DefaultSizes.defaultKeyPadding),
        child: ElevatedButton(
          onPressed: ()=>buttonFunction(buttonId),
          child: Text(buttonId),
        ),
      ),
    );
  }
}

class EqualButton extends StatelessWidget {
  final Function buttonFunction;
  const EqualButton(this.buttonFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.all(DefaultSizes.defaultKeyPadding),
        child: ElevatedButton(
          style: equalButtonStyle(),
          onPressed: ()=>buttonFunction('='),
          child: const Text('='),
        ),
      ),
    );
  }
}
