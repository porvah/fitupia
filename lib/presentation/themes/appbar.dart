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
      child: ListView(
        children: [
          Container(
              decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)]),
              child: Image.asset('assets/images/poseidon.png')),
          const ListTile(
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ));
}
