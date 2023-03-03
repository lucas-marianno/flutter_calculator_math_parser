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
  final String keyText;
  const DefaultButton(this.keyText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(DefaultSizes.defaultKeyPadding),
        child: ElevatedButton(onPressed: () {}, child: Text(keyText)),
      ),
    );
  }
}

class EqualButton extends StatelessWidget {
  const EqualButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.all(DefaultSizes.defaultKeyPadding),
        child: ElevatedButton(
          style: equalButtonStyle(),
          onPressed: () {},
          child: const Text('='),
        ),
      ),
    );
  }
}
