import 'package:flutter/material.dart';
import '../screens/dummy_screen.dart';

AppBar buildAppBar(String title, Color textColor, Color backgroundColor) {
  return AppBar(
    backgroundColor: backgroundColor,
    leading: BackButton(
      color: textColor,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: textColor,
      ),
    ),
  );
}

Drawer drawer(Color drawerColor, Image img, BuildContext context) {
  return Drawer(
      backgroundColor: drawerColor,
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)]),
            child: img,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(DummyScreen.routeName);
            },
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(DummyScreen.routeName);
            },
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ));
}
