import 'package:flutter/material.dart';

class AppletSelectionButton extends StatelessWidget {
  const AppletSelectionButton({
    required this.title,
    required this.icon,
    required this.navigateTo,
    super.key,
  });
  final String navigateTo;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, navigateTo);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Icon(icon, size: 80)),
          SizedBox(
            height: 20,
            child: FittedBox(child: Text(title)),
          ),
        ],
      ),
    );
  }
}
