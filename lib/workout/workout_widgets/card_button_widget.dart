import 'package:fitupia/workout/workout_classes/card_content.dart';
import 'package:flutter/material.dart';



class CardButtonWidget extends StatelessWidget {
  const CardButtonWidget({
    super.key,
    required this.card,
    required this.route,
    required this.gender,
  });

  final CardContent card;
  final String route; 
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, route, arguments: gender);
      },
      child: Ink.image(
        image: AssetImage(card.imgPath),
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        height: 200.0,
        fit: BoxFit.fill,
        child: Center(
          child: Text(
            "${card.name} Exercises",
            style: const TextStyle(
              fontFamily: "CaesarDressing",
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
      ),
    );
  }
}