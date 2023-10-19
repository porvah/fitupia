import 'package:flutter/material.dart';

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

Drawer drawer(Color drawerColor, Image img) {
  return Drawer(
      backgroundColor: drawerColor,
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)]),
            child: img,
          ),
          const ListTile(
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          const ListTile(
            title: Text(
              'Diet Plan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
          ),
          const ListTile(
            title: Text(
              'Exercise ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: Icon(
              Icons.fitness_center_rounded,
              color: Colors.white,
            ),
          ),
          const ListTile(
            title: Text(
              'Calendar Routine',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: Icon(
              Icons.calendar_month_rounded,
              color: Colors.white,
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          const ListTile(
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ));
}
