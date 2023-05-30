import 'package:calculator2/constants.dart';
import 'package:calculator2/routes.dart';
import 'package:calculator2/widgets/keyboard_layout.dart';
import 'package:calculator2/widgets/screen.dart';
import 'package:flutter/material.dart';
import '../brain/logic.dart';

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
        appBar: AppBar(actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, aboutScreen),
            icon: const Icon(
              Icons.settings,
              color: kTextColor,
            ),
          ),
        ]),
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            Screen(screenValue, memoryValue),
            Keyboard(updateScreen),
          ],
        ),
      ),
    );
  }
}
