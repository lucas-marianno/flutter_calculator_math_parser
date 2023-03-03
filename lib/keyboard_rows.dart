import 'package:flutter/material.dart';
import 'buttons.dart';

class MemRow extends StatelessWidget {
  const MemRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FunctionButton('MC'),
        FunctionButton('MR'),
        FunctionButton('M+'),
        FunctionButton('M-'),
        FunctionButton('MS'),
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
        NumButton('%'),
        NumButton('CE'),
        NumButton('AC'),
        NumButton('DEL'),
        NumButton('x^y'),
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
        NumButton('7'),
        NumButton('8'),
        NumButton('9'),
        NumButton('('),
        NumButton(')'),
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
        NumButton('4'),
        NumButton('5'),
        NumButton('6'),
        NumButton('X'),
        NumButton('/'),
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
        NumButton('1'),
        NumButton('2'),
        NumButton('3'),
        NumButton('+'),
        NumButton('-'),
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
        NumButton('+-'),
        NumButton('0'),
        NumButton('.'),
        EqualButton(),
      ],
    );
  }
}
