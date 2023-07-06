import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class RandomShit {
  static Color color() {
    return Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    );
  }

  static String text() {
    return loremIpsum(words: Random().nextInt(3) + 3);
  }

  static Container container() {
    return Container(
      color: color(),
      child: Center(
        child: Text(
          text(),
          style: const TextStyle(
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static Widget button() {
    String label = loremIpsum(words: 1);
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color()),
      ),
      child: Text(label),
    );
  }

  static List<Widget> multiplier(Widget shit, int shitAmount) {
    List<Widget> multipleShit = [];
    for (int i = 0; i < shitAmount; i++) {
      multipleShit.add(shit);
    }
    return multipleShit;
  }
}
