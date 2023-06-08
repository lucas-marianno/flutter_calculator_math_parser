import 'package:flutter/material.dart';
import '../brain/memory.dart';
import '../constants.dart';

enum Emphasis { zero, low, high }

class ButtonId {
  static const String zero = '0',
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
      divide = '\u00f7',
      openParentheses = '(',
      closeParentheses = ')',
      dot = '.',
      squareRoot = '\u221a',
      c = 'C',
      ac = 'AC',
      delete = '<-',
      power = '^',
      mr = 'MR',
      ms = 'MS',
      mc = 'MC',
      go = 'GO';

  ButtonId();
}

class ButtonLabel extends StatelessWidget {
  final String buttonId;
  const ButtonLabel(this.buttonId, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget label = Text(buttonId);

    if ('0123456789.()AC'.contains(buttonId)) {
      label = Text(buttonId);
    } else {
      switch (buttonId) {
        case ButtonId.add:
          label = const Icon(Icons.add);
          break;
        case ButtonId.subtract:
          label = const Icon(Icons.remove);
          break;
        case ButtonId.multiply:
          label = const Icon(Icons.close);
          break;
        case ButtonId.divide:
          label = const Text(ButtonId.divide);
          break;
        case ButtonId.squareRoot:
          label = const Text('²${ButtonId.squareRoot}');
          break;
        case ButtonId.delete:
          label = const Icon(Icons.backspace_outlined);
          break;
        case ButtonId.power:
          label = const Text('xⁿ');
          break;
      }
    }

    return FittedBox(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: label,
    ));
  }
}

class DefaultButton extends StatelessWidget {
  final String buttonId;
  final Function buttonFunction;
  final Emphasis? emphasis;
  final int? flex;

  const DefaultButton(
    this.buttonId,
    this.buttonFunction, {
    super.key,
    this.emphasis,
    this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Padding(
        padding: const EdgeInsets.all(kKeyPadding),
        child: () {
          if (emphasis != Emphasis.zero) {
            return ElevatedButton(
              style: defaultButtonStyle(emphasis),
              onPressed: () => buttonFunction(buttonId),
              child: ButtonLabel(buttonId),
            );
          }
          return TextButton(
            // Deactivates the memory buttons in case the memory is empty
            onPressed: Memory.getMemoryValue() == 0 &&
                    (buttonId == ButtonId.mr || buttonId == ButtonId.mc)
                ? null
                : () => buttonFunction(buttonId),
            child: ButtonLabel(buttonId),
          );
        }(),
      ),
    );
  }
}

ButtonStyle defaultButtonStyle(Emphasis? emphasis) {
  Color color() {
    if (emphasis == Emphasis.high) return kHighEmphasisButtonColor;
    if (emphasis == Emphasis.low) return kLowEmphasisButtonColor;
    return kDefaultButtonColor;
  }

  return ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(color()),
    foregroundColor: const MaterialStatePropertyAll(kTextColor),
    textStyle: const MaterialStatePropertyAll(kButtonTextStyle),
  );
}
