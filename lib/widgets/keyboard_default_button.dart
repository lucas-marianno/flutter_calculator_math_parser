import 'package:flutter/material.dart';
import '../brain/memory.dart';
import '../constants.dart';

class ButtonLabel extends StatelessWidget {
  final String buttonId;
  const ButtonLabel(this.buttonId, {super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: kButtonLabel[buttonId]!,
    ));
  }
}

class DefaultKeyboardButton extends StatelessWidget {
  final String buttonId;
  final Function buttonFunction;
  final Emphasis? emphasis;
  final int? flex;

  const DefaultKeyboardButton(
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
            style: const ButtonStyle(
                textStyle: MaterialStatePropertyAll(kFunctionButtonTextStyle),
                padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            // Deactivates the memory buttons in case the memory is empty
            onPressed:
                Memory.getMemoryValue() == 0 && (buttonId == ButtonId.mr || buttonId == ButtonId.mc)
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
