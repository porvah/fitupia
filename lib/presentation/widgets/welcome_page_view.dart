import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class WelcomePageView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const WelcomePageView(
      {required this.imagePath,
      required this.title,
      required this.description,
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
          _getImage(),
        ],
      ),
    );
  }

  Widget _getData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle(),
        _getDescription(),
      ],
    );
  }

  Widget _getTitle() {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(26),
      ),
    );
  }

  Widget _getDescription() {
    return Text(
      description,
      style: TextStyle(
        fontSize: SizeConfig.getProportionateScreenWidth(18),
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
