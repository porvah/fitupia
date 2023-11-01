import 'package:first_app/diet.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Diet'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.greenAccent),
          child: const Diet(),
        ),
      ),
    );
  }
}
