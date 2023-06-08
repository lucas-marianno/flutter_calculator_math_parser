import 'package:flutter/material.dart';
import '../routes.dart';

class PopupMenu extends StatelessWidget {
  // TODO: Feature: Replace this widget by a top navigation bar.
  // TODO: Bugfix: Ao ir pra tela BMI e voltar, a calculadora para de atualizar
  // o display com as entradas da memória.
  //
  // Possivel causa: tem a ver com Navigator.pop antes do push | quebra o State
  // atual pra ir pra outra tela
  //
  // 'This error happens if you call setState() on a State object for a widget
  // that no longer appears in the widget tree (e.g., whose parent widget no
  // longer includes the widget in its build).'
  const PopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == Pages.aboutPage) {
          Navigator.pushNamed(context, value);
        } else {
          Navigator.popAndPushNamed(context, value);
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: Pages.calculatorPage, child: Text('Calculator')),
        PopupMenuItem(value: Pages.bmiPage, child: Text('BMI Calculator')),
        PopupMenuItem(
          value: Pages.aboutPage,
          child: Row(
            children: [Text('About  '), Icon(Icons.info_outline)],
          ),
        ),
      ],
    );
  }
}
