import 'package:flutter/material.dart';
import '../size_config/size_config.dart';

class DummyScreen extends StatelessWidget {
  static const String routeName = '/dummy_screen';

  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('dummy'),
      ),
    );
  }
}
