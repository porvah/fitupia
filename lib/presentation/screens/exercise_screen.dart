import 'package:first_app/presentation/themes/appbar.dart';
import 'package:flutter/material.dart';

import '../../models/card_content.dart';
import '../size_config/size_config.dart';

class ExerciseScreen extends StatelessWidget {
  final CardContent card;

  const ExerciseScreen({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        card.name,
        const Color(0xFF455766),
        const Color(0xFFBED8ED),
      ),
      body: SafeArea(
        child: Hero(
          tag: card.imgPath,
          child: Image.asset(
            card.imgPath,
            fit: BoxFit.fill,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.25,
          ),
        ),
      ),
    );
  }
}
