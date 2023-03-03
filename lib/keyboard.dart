import 'package:calculator2/style.dart';
import 'package:flutter/material.dart';

class FunctionKey extends StatelessWidget {
  final String keyText;
  const FunctionKey(this.keyText,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DefaultSizes.defaultKeyPadding),
      child: ElevatedButton(
        style: functionButtonStyle(),
        onPressed: () {},
        child: Text(
          keyText,
          //style: keyTextStyle(),
        ),
      ),
    );
  }
}

class NumKey extends StatelessWidget {
  final String keyText;
  const NumKey(this.keyText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DefaultSizes.defaultKeyPadding),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          keyText,
          //style: keyTextStyle(),
        ),
      ),
    );
  }
}
class EqualKey extends StatelessWidget {
  const EqualKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DefaultSizes.defaultKeyPadding),
      child: ElevatedButton(
        style: equalButtonStyle(),
        onPressed: () {},
        child: Text(
          '=',
          //style: keyTextStyle(),
        ),
      ),
    );
  }
}

class MemRow extends StatelessWidget {
  const MemRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FunctionKey('MC'),
        FunctionKey('MR'),
        FunctionKey('M+'),
        FunctionKey('M-'),
        FunctionKey('MS'),
      ],
    );
  }
}

class Row0 extends StatelessWidget {
  const Row0({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const[
        NumKey('%'),
        NumKey('CE'),
        NumKey('AC'),
        NumKey('DEL'),
        NumKey('x^y'),
      ],
    );
  }
}
class Row1 extends StatelessWidget {
  const Row1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const[
        NumKey('7'),
        NumKey('8'),
        NumKey('9'),
        NumKey('('),
        NumKey(')'),
      ],
    );
  }
}

class Row2 extends StatelessWidget {
  const Row2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        NumKey('4'),
        NumKey('5'),
        NumKey('6'),
        NumKey('X'),
        NumKey('/'),
      ],
    );
  }
}

class Row3 extends StatelessWidget {
  const Row3({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        NumKey('1'),
        NumKey('2'),
        NumKey('3'),
        NumKey('+'),
        NumKey('-'),
      ],
    );
  }
}

class Row4 extends StatelessWidget {
  const Row4({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        NumKey('+-'),
        NumKey('0'),
        NumKey('.'),
        EqualKey(),
      ],
    );
  }
}
