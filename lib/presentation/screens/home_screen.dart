import 'package:flutter/material.dart';
import "../themes/appbar.dart";
import '../size_config/size_config.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: appBar(const Color.fromARGB(255, 70, 163, 240)),
      drawer: drawer(const Color.fromARGB(255, 47, 76, 99)),
      body: SafeArea(
          child: ListView(children: const [
        Card(
          elevation: 5,
          shadowColor: Colors.black,
          color: Color.fromARGB(255, 184, 147, 46),
          child: Row(
            children: [Text('data')],
          ),
        )
      ])),
    );
  }
}
