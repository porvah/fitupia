import 'package:flutter/material.dart';

import '../../models/card_content.dart';
import '../screens/exercise_screen.dart';
import '../size_config/size_config.dart';

class ExerciseCard extends StatelessWidget {
  final CardContent card;

  const ExerciseCard({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ExerciseScreen(card: card),
          ),
        );
      },
      child: _buildHeroAnimation(
        child: Container(
          margin: const EdgeInsets.all(7.0),
          height: SizeConfig.screenHeight * 0.25,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(card.imgPath),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF4d4d4d).withOpacity(0.1),
                  const Color(0xFF333333).withOpacity(0.4),
                  const Color(0xFF1a1a1a).withOpacity(0.5),
                  const Color(0xFF000000).withOpacity(0.5),
                ],
              ),
            ),
            child: _getText(),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroAnimation({required Widget child}) {
    return Hero(
      tag: card.imgPath,
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }

  Center _getText() {
    return Center(
      child: Text(
        card.name,
        style: TextStyle(
          letterSpacing: 1.0,
          fontFamily: "CaesarDressing",
          fontSize: SizeConfig.getProportionateScreenWidth(38),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
