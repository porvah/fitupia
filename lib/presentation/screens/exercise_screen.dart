import 'package:flutter/material.dart';

import '../../models/card_content.dart';
import '../size_config/size_config.dart';

class ExerciseScreen extends StatelessWidget {
  final CardContent card;

  const ExerciseScreen({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFBED8ED),
      leading: const BackButton(
        color: Color(0xFF455766),
      ),
      title: Text(
        card.name,
        style: const TextStyle(
          color: Color(0xFF455766),
        ),
      ),
    );
  }
}
