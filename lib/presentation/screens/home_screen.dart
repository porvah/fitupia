import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fitupia')),
      body: SafeArea(child: Container()),
    );
  }
}
