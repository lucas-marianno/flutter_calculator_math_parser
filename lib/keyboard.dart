import 'package:calculator2/color_palette.dart';
import 'package:flutter/material.dart';

class FunctionKey extends StatelessWidget {
  const FunctionKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'MEM',
          style: keyTextStyle(),
        ),
      ),
    );
  }
}

class NumKey extends StatelessWidget {
  const NumKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          '0',
          style: keyTextStyle(),
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
        FunctionKey(),
        FunctionKey(),
        FunctionKey(),
        FunctionKey(),
        FunctionKey(),
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
        NumKey(),
        NumKey(),
        NumKey(),
        NumKey(),
        NumKey(),
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
        NumKey(),
        NumKey(),
        NumKey(),
        NumKey(),
        NumKey(),
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
        NumKey(),
        NumKey(),
        NumKey(),
        NumKey(),
        NumKey(),
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
        NumKey(),
        NumKey(),
        NumKey(),
        NumKey(),
        NumKey(),
      ],
    );
  }
}
