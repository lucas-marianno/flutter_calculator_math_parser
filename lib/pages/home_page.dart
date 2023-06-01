import 'package:calculator2/constants.dart';
import 'package:calculator2/widgets/keyboard_builder.dart';
import 'package:calculator2/widgets/screens.dart';
import 'package:flutter/material.dart';
import '../brain/logic.dart';
import '../widgets/popupmenu.dart';
import '../widgets/keyboards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String screenValue = '0';
  Widget memoryValue = const Expanded(child: Text(''));

  updateScreen(buttonId) {
    setState(() {
      screenValue = Logic.newScreenValue(buttonId, screenValue);
      memoryValue = Logic.newMemoryScreenValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('CALCULATOR'),
            actions: const [PopupMenu()]),
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            CalculatorScreen(screenValue, memoryValue),
            const Divider(),
            KeyboardBuilder(
              firstRowShorter: true,
              keyboard: calculatorKeyboard(updateScreen),
            ),
          ],
        ),
      ),
    );
  }
}
