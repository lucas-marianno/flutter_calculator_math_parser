import 'package:flutter/material.dart';

class KeyboardBuilder extends StatelessWidget {
  /// The keyboard will be built in the form of <Column<Row<Widget>>
  final bool? firstRowShorter;
  final List<List<Widget>> keyboard;
  final int? flex;
  final String? heroTag;

  const KeyboardBuilder({
    super.key,
    this.firstRowShorter,
    this.flex,
    this.heroTag,
    required this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    int firstRowFlex = firstRowShorter ?? false ? 1 : 2;

    List<Widget> tempColumn = [];
    for (List<Widget> row in keyboard) {
      List<Widget> tempRow = [];
      for (Widget button in row) {
        tempRow.add(button);
      }
      tempColumn.add(Expanded(
        // Makes the first row half the height of the others
        flex: row == keyboard[0] ? firstRowFlex : 2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: tempRow,
        ),
      ));
    }
    // return Expanded(
    //   flex: flex ?? 2,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: tempColumn,
    //   ),
    // );
    if (heroTag == null) {
      return Expanded(
        flex: flex ?? 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tempColumn,
        ),
      );
    } else {
      return Expanded(
        flex: flex ?? 2,
        child: Hero(
          tag: heroTag!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tempColumn,
          ),
        ),
      );
    }
  }
}
