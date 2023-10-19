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
      appBar: appBar(const Color.fromARGB(255, 70, 163, 240), context),
      drawer: drawer(const Color.fromARGB(255, 1, 76, 138),
          Image.asset('assets/images/poseidon.png')),
      body: SafeArea(
          child: ListView(children: const [
        SizedBox(
            height: 300,
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Color.fromARGB(255, 184, 147, 46),
              child: Row(
                children: [
                  Text('Diet'),
                ],
              ),
            )),
        SizedBox(
            height: 300,
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Color.fromARGB(255, 184, 147, 46),
              child: Row(
                children: [
                  Text('Diet'),
                ],
              ),
            )),
        SizedBox(
            height: 300,
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Color.fromARGB(255, 184, 147, 46),
              child: Row(
                children: [
                  Text('Diet'),
                ],
              ),
            ))
      ])),
    );
  }
}
