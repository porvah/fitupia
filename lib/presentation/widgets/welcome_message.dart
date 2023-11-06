import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(),
        _buildMessage(),
      ],
    );
  }

  Text _buildMessage() {
    return Text(
      'Welcome to Fitupia',
      style: TextStyle(
        color: const Color.fromARGB(255, 2, 106, 154),
        fontSize: SizeConfig.getProportionateScreenWidth(20),
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Container _buildImage() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: SizeConfig.screenWidth * .35,
      child: Image.asset(
        'assets/logo2.jpg',
      ),
    );
  }
}
