import 'package:flutter/material.dart';
import '../screens/dummy_screen.dart';

AppBar appBar(Color barColor, BuildContext context) {
  return AppBar(
      title: const Text(
        'Fitupia',
        style: TextStyle(fontFamily: 'Fitupia', fontSize: 40),
      ),
      backgroundColor: barColor,
      foregroundColor: Colors.white,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }));
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
              'Diet Plan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: const Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(DummyScreen.routeName);
            },
            title: const Text(
              'Exercise ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: const Icon(
              Icons.fitness_center_rounded,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(DummyScreen.routeName);
            },
            title: const Text(
              'Calendar Routine',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: const Icon(
              Icons.calendar_month_rounded,
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
