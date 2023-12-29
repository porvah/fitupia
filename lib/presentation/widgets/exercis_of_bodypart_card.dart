import 'package:first_app/models/card_content.dart';
import 'package:first_app/presentation/screens/exercise_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/presentation/size_config/size_config.dart';

class ExerciseOfBodyPartCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final CardContent card;

  const ExerciseOfBodyPartCard({
    super.key,
    required this.data,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ExerciseDetailsScreen(name: card.name, data: data),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(7.0),
        height: SizeConfig.screenHeight * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFecf3fa)),
        child: Row(
          children: [
            Hero(
              tag: data['id'],
              child: Container(
                margin: const EdgeInsets.all(7.0),
                width: SizeConfig.screenWidth * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        image: NetworkImage(data["gifUrl"]), fit: BoxFit.fill)),
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: _getText(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _getText() {
    return Text(
      data["name"],
      style: TextStyle(
        letterSpacing: 1.0,
        fontSize: SizeConfig.getProportionateScreenWidth(20),
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
