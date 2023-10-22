import 'package:flutter/material.dart';
import 'package:fitupia/workout/exercises_classes/Exercis.dart';


class ExercisButtonWidget extends StatelessWidget {
  const ExercisButtonWidget({
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
          onTap: () {
            Navigator.pushNamed(context, "/${exercis.name.toLowerCase()}_screen");
          },
          child: Ink.image(
            image: AssetImage(exercis.imgPath),
            colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
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