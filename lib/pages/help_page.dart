import 'package:flutter/material.dart';
import 'package:math_expression_parser/util/md_reader.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: MdReader('assets/markdown/help.md'),
      ),
    );
  }
}
