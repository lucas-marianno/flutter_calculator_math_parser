import 'package:flutter/material.dart';

import 'style.dart';


AppBar myAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Palette.darkest,
    actions: [
      PopupMenuButton(
        icon: const Icon(Icons.settings),
        itemBuilder: (BuildContext context) {
          return const [
            PopupMenuItem(child: Text('hi')),
          ];
        },
      ),
    ],
  );
}