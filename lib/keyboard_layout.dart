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
  const MemRow(this.updateScreenFunction,{super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FunctionButton('MC'),
          FunctionButton('MR'),
          FunctionButton('M+'),
          FunctionButton('M-'),
          FunctionButton('MS'),
        ],
      ),
    );
  }
}

class Row0 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row0(this.updateScreenFunction,{super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton('%', updateScreenFunction),
          DefaultButton('CE', updateScreenFunction),
          DefaultButton('AC', updateScreenFunction),
          DefaultButton('DEL', updateScreenFunction),
          DefaultButton('x^y', updateScreenFunction),
        ],
      ),
    );
  }
}

class Row1 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row1(this.updateScreenFunction,{super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton('7', updateScreenFunction),
          DefaultButton('8', updateScreenFunction),
          DefaultButton('9', updateScreenFunction),
          DefaultButton('(', updateScreenFunction),
          DefaultButton(')', updateScreenFunction),
        ],
      ),
    );
  }
}

class Row2 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row2(this.updateScreenFunction,{super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton('4', updateScreenFunction),
          DefaultButton('5', updateScreenFunction),
          DefaultButton('6', updateScreenFunction),
          DefaultButton('*', updateScreenFunction),
          DefaultButton('/', updateScreenFunction),
        ],
      ),
    );
  }
}

class Row3 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row3(this.updateScreenFunction,{super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton('1', updateScreenFunction),
          DefaultButton('2', updateScreenFunction),
          DefaultButton('3', updateScreenFunction),
          DefaultButton('+', updateScreenFunction),
          DefaultButton('-', updateScreenFunction),
        ],
      ),
    );
  }
}

class Row4 extends StatelessWidget {
  final Function updateScreenFunction;
  const Row4(this.updateScreenFunction,{super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton('+-', updateScreenFunction),
          DefaultButton('0', updateScreenFunction),
          DefaultButton('.', updateScreenFunction),
          EqualButton(updateScreenFunction),
        ],
      ),
    );
  }
}
