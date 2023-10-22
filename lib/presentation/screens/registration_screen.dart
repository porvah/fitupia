import 'package:flutter/material.dart';

import '../widgets/custom_input_field.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration_screen';

  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: const SafeArea(
        child: CustomInputField(
          hintText: 'Name',
          icon: Icon(Icons.person),
        ),
      ),
    );
  }
}
