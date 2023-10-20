import 'package:fitupia/workout/Exercis.dart';
import 'package:flutter/material.dart';


class ExercisWidget extends StatelessWidget {
  const ExercisWidget({
    super.key,
    required this.exercis,
  });

  final Exercis exercis;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {},
          child: Ink.image(
            image: AssetImage(exercis.imgPath),
            height: 200.0,
            fit: BoxFit.fill,
            child: Center(
              child: Text(
                "${exercis.name} Exercises",
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