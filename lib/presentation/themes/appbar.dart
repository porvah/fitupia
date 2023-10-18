import 'package:flutter/material.dart';

AppBar appBar(Color barColor) {
  return AppBar(
    title: const Text(
      'Fitupia',
    ),
    backgroundColor: barColor,
    foregroundColor: Colors.white,
  );
}

Drawer drawer(Color drawerColor) {
  return Drawer(
    backgroundColor: drawerColor,
    child: ListView(children: const [ListTile(title: Text('Profile'))]),
  );
}
