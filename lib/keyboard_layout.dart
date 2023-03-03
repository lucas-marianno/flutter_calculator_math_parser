import 'package:flutter/material.dart';
import 'buttons.dart';

class KeyBoard extends StatelessWidget {
  const KeyBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MemRow(),
        Row0(),
        Row1(),
        Row2(),
        Row3(),
        Row4(),
      ],
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
      children: const [
        DefaultButton('%'),
        DefaultButton('CE'),
        DefaultButton('AC'),
        DefaultButton('DEL'),
        DefaultButton('x^y'),
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
      children: const [
        DefaultButton('7'),
        DefaultButton('8'),
        DefaultButton('9'),
        DefaultButton('('),
        DefaultButton(')'),
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
        DefaultButton('4'),
        DefaultButton('5'),
        DefaultButton('6'),
        DefaultButton('X'),
        DefaultButton('/'),
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
        DefaultButton('1'),
        DefaultButton('2'),
        DefaultButton('3'),
        DefaultButton('+'),
        DefaultButton('-'),
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
        DefaultButton('+-'),
        DefaultButton('0'),
        DefaultButton('.'),
        EqualButton(),
      ],
    );
  }
}
