import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            const CustomInputField(
              hintText: 'Name',
              icon: Icon(Icons.person),
            ),
            const CustomInputField(
              hintText: 'Age',
              icon: Icon(Icons.numbers),
            ),
            const Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    hintText: 'Height',
                    icon: Icon(Icons.height),
                  ),
                ),
                Expanded(
                  child: CustomInputField(
                    hintText: 'Weight',
                    icon: Icon(Icons.monitor_weight_outlined),
                  ),
                ),
              ],
            ),
            const CustomInputField(
              hintText: 'Goal',
              icon: Icon(Icons.height),
            ),
            CustomButton(title: 'Register', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
