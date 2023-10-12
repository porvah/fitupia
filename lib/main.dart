import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const FitupiaApp());
}

class FitupiaApp extends StatelessWidget {
  const FitupiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fitupia',
      home: HomeScreen(),
    );
  }
}
