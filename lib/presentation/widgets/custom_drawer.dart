import 'package:first_app/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 25, 102, 166),
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
            ),
            child: Image.asset('assets/images/poseidon.png'),
          ),
          _buildItem(context, 'Profile', Icons.account_circle,
              ProfileScreen.routeName),
          const Divider(
            color: Colors.grey,
          ),
          _buildItem(
            context,
            'Settings',
            Icons.settings,
            SettingsScreen.routeName,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String title,
    IconData icon,
    String screen,
  ) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).pushNamed(screen);
      },
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      leading: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
