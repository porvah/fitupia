import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../size_config/size_config.dart';
import 'custom_button.dart';

class WelcomePageView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool haveButton;

  const WelcomePageView(
      {required this.imagePath,
      required this.title,
      required this.description,
      this.haveButton = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getData(),
          if (haveButton)
            CustomButton(
              title: 'Get Started',
              icon: Icons.arrow_forward_ios_outlined,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            ),
          _getImage(),
        ],
      ),
    );
  }

  Widget _getData() {
    return SizedBox(
      width: SizeConfig.screenWidth / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTitle(),
          _getDescription(),
        ],
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(22),
      ),
    );
  }

  Widget _getDescription() {
    return Text(
      description,
      style: TextStyle(
        fontSize: SizeConfig.getProportionateScreenWidth(16),
        color: Colors.black54,
      ),
    );
  }

  Widget _getImage() {
    return Image.asset(
      imagePath,
      height: SizeConfig.screenHeight / 2,
    );
  }
}
