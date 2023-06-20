import 'package:flutter/material.dart';
import 'package:math_expression_parser/constants.dart';

class SandboxPage extends StatefulWidget {
  const SandboxPage({super.key});

  @override
  State<SandboxPage> createState() => _SandboxPageState();
}

class _SandboxPageState extends State<SandboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sandbox Page'), centerTitle: true),
      body: Center(
        child: Text(
          '0123456789${_superScript('0123&&abcABC')}',
          style: const TextStyle(textBaseline: TextBaseline.alphabetic, fontSize: 50),
        ),
      ),
    );
  }
}

String _superScript(String n) {
  String ans = '';
  n.split('').forEach((e) {
    if (kToSuperScript.containsKey(e)) {
      ans += kToSuperScript[e]!;
    }
  });

  return ans;
}
