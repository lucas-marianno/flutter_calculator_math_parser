import 'package:flutter/material.dart';
import '../routes.dart';

class PopupMenu extends StatelessWidget {
  // TODO: Feature: Replace this widget by a top navigation bar.
  // TODO: Bugfix: Ao ir pra tela BMI e voltar, a calculadora para de atualizar o display com as entradas da memória.
  // Possivel causa: tem a ver com Navigator.pop antes do push | quebra o State atual pra ir pra outra tela
  const PopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == aboutPage) {
          Navigator.pushNamed(context, value);
        } else {
          Navigator.popAndPushNamed(context, value);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: calculatorPage, child: const Text('Calculator')),
        PopupMenuItem(value: bmiPage, child: const Text('BMI Calculator')),
        PopupMenuItem(
          value: aboutPage,
          child: const Row(
            children: [Text('About  '), Icon(Icons.info_outline)],
          ),
        ),
      ],
    );
  }
}
