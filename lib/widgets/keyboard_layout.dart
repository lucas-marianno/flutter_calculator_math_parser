import 'package:flutter/material.dart';
import 'buttons.dart';

class Keyboard extends StatelessWidget {
  final Function updateScreenFunction;
  const Keyboard(this.updateScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    // Column<Row<widget>>
    final List<List<Widget>> keyboardLayout = [
      [
        FunctionButton(ButtonId.mr, updateScreenFunction),
        FunctionButton(ButtonId.ms, updateScreenFunction),
      ],
      [
        DefaultButton(ButtonId.squareRoot, updateScreenFunction),
        DefaultButton(ButtonId.power, updateScreenFunction),
        DefaultButton(ButtonId.c, updateScreenFunction),
        DefaultButton(ButtonId.ac, updateScreenFunction),
        DefaultButton(ButtonId.delete, updateScreenFunction),
      ],
      [
        DefaultButton(ButtonId.seven, updateScreenFunction),
        DefaultButton(ButtonId.eight, updateScreenFunction),
        DefaultButton(ButtonId.nine, updateScreenFunction),
        DefaultButton(ButtonId.openParentheses, updateScreenFunction),
        DefaultButton(ButtonId.closeParentheses, updateScreenFunction),
      ],
      [
        DefaultButton(ButtonId.four, updateScreenFunction),
        DefaultButton(ButtonId.five, updateScreenFunction),
        DefaultButton(ButtonId.six, updateScreenFunction),
        DefaultButton(ButtonId.multiply, updateScreenFunction),
        DefaultButton(ButtonId.divide, updateScreenFunction),
      ],
      [
        DefaultButton(ButtonId.one, updateScreenFunction),
        DefaultButton(ButtonId.two, updateScreenFunction),
        DefaultButton(ButtonId.three, updateScreenFunction),
        DefaultButton(ButtonId.add, updateScreenFunction),
        DefaultButton(ButtonId.subtract, updateScreenFunction),
      ],
      [
        DefaultButton('buttonId', () {}),
        DefaultButton(ButtonId.zero, updateScreenFunction),
        DefaultButton(ButtonId.dot, updateScreenFunction),
        EqualButton(updateScreenFunction),
      ],
    ];

    List<Widget> tempColumn = [];
    for (List<Widget> row in keyboardLayout) {
      List<Widget> tempRow = [];
      for (Widget button in row) {
        tempRow.add(button);
      }
      tempColumn.add(Expanded(
        // Makes the first row half the height of the others
        flex: row == keyboardLayout[0] ? 1 : 2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: tempRow,
        ),
      ));
    }

    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tempColumn,
      ),
    );
  }
}
