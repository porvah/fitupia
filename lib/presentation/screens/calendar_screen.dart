import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class CalendarScreen extends StatelessWidget {
  static const String routeName = '/calendar_screen';

  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Text("hello bitches"),
      )),
    );
  }
}
