import 'package:flutter/material.dart';
import 'buttons.dart';

class KeyBoard extends StatelessWidget {
  final Function updateScreenFunction;
  const KeyBoard(this.updateScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          MemRow(updateScreenFunction),
          Row0(updateScreenFunction),
          Row1(updateScreenFunction),
          Row2(updateScreenFunction),
          Row3(updateScreenFunction),
          Row4(updateScreenFunction),
        ],
      ),
    );
  }
}

class MemRow extends StatelessWidget {
  final Function updateScreenFunction;
  const MemRow(this.updateScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FunctionButton(ButtonId.mr, updateScreenFunction),
          FunctionButton(ButtonId.ms, updateScreenFunction),
        ],
      ),
    );
  }
}

class Row0 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row0(this.updateScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(ButtonId.squareRoot, updateScreenFunction),
          DefaultButton(ButtonId.power, updateScreenFunction),
          DefaultButton(ButtonId.c, updateScreenFunction),
          DefaultButton(ButtonId.ac, updateScreenFunction),
          DefaultButton(ButtonId.delete, updateScreenFunction),
        ],
      ),
    );
  }
}

class Row1 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row1(this.updateScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(ButtonId.seven, updateScreenFunction),
          DefaultButton(ButtonId.eight, updateScreenFunction),
          DefaultButton(ButtonId.nine, updateScreenFunction),
          DefaultButton(ButtonId.openParentheses, updateScreenFunction),
          DefaultButton(ButtonId.closeParentheses, updateScreenFunction),
        ],
      ),
    );
  }
}

class Row2 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row2(this.updateScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(ButtonId.four, updateScreenFunction),
          DefaultButton(ButtonId.five, updateScreenFunction),
          DefaultButton(ButtonId.six, updateScreenFunction),
          DefaultButton(ButtonId.multiply, updateScreenFunction),
          DefaultButton(ButtonId.divide, updateScreenFunction),
        ],
      ),
    );
  }
}

class Row3 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row3(this.updateScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(ButtonId.one, updateScreenFunction),
          DefaultButton(ButtonId.two, updateScreenFunction),
          DefaultButton(ButtonId.three, updateScreenFunction),
          DefaultButton(ButtonId.add, updateScreenFunction),
          DefaultButton(ButtonId.subtract, updateScreenFunction),
        ],
      ),
    );
  }
}

class Row4 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row4(this.updateScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DefaultButton(ButtonId.rndUp, updateScreenFunction),
              DefaultButton(ButtonId.rndDown, updateScreenFunction),
            ],
          )),
          DefaultButton(ButtonId.zero, updateScreenFunction),
          DefaultButton(ButtonId.dot, updateScreenFunction),
          EqualButton(updateScreenFunction),
        ],
      ),
    );
  }
}
