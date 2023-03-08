import 'package:flutter/material.dart';
import 'style.dart';


class ButtonId {
  static const String 
    zero = '0',
    one = '1',
    two = '2',
    three = '3',
    four = '4',
    five = '5',
    six = '6',
    seven = '7',
    eight = '8',
    nine = '9',
    equal = '=',
    add = '+',
    subtract = '-',
    multiply = '*',
    divide = '/',
    openParentheses = '(',
    closeParentheses = ')',
    dot = '.',
    squareRoot = '¬',
    percent = '%',
    c = 'C',
    ac = 'AC',
    delete = '<-',
    power = '^',
    mc = 'MC',
    mr = 'MR',
    mAdd = 'M+',
    mSub = 'M-',
    ms = 'MS';
  ButtonId();
}


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
          onPressed: ()=>buttonFunction(ButtonId.equal),
          child: Text(ButtonId.equal),
        ),
      ),
    );
  }
}
