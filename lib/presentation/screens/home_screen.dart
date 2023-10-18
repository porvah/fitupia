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
      drawer: drawer(Color.fromARGB(255, 47, 76, 99)),
      body: SafeArea(child: Container()),
    );
  }
}
