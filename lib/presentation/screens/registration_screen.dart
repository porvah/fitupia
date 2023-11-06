import 'package:first_app/presentation/widgets/label_input_field.dart';
import 'package:flutter/material.dart';

import '../size_config/size_config.dart';
import '../widgets/custom_button.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration_screen';

  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: SizeConfig.screenWidth * .3,
              child: Image.asset(
                'assets/logo.png',
                width: SizeConfig.screenWidth * .1,
              ),
            ),
            Text(
              'Welcome to Fitupia',
              style: TextStyle(
                color: const Color.fromARGB(255, 2, 106, 154),
                fontSize: SizeConfig.getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const LabelInputField(
              title: 'Name',
              hintText: 'Enter your name',
              icon: Icon(Icons.person),
            ),
            const LabelInputField(
              title: 'Age',
              hintText: 'Choose your date of birth',
              textInputType: TextInputType.number,
              icon: Icon(Icons.calendar_today_rounded),
            ),
            const LabelInputField(
              title: 'Gender',
              hintText: 'Choose your gender',
              textInputType: TextInputType.number,
              icon: Icon(Icons.male),
            ),
            const Row(
              children: [
                Expanded(
                  child: LabelInputField(
                    title: 'Height',
                    hintText: 'Enter your height',
                    icon: Icon(Icons.height),
                  ),
                ),
                Expanded(
                  child: LabelInputField(
                    title: 'Weight',
                    hintText: 'Enter your weight',
                    icon: Icon(Icons.monitor_weight_outlined),
                  ),
                ),
              ],
            ),
            const LabelInputField(
              title: 'Goal',
              hintText: 'Choose your goal',
              icon: Icon(Icons.height),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                title: 'Register',
                backgroundColor: const Color.fromARGB(255, 2, 106, 154),
                color: Colors.white,
                fontSize: SizeConfig.getProportionateScreenWidth(20),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
