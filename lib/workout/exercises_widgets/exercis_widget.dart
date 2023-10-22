import 'package:fitupia/workout/exercises_classes/Exercis.dart';
import 'package:flutter/material.dart';

class ExercisWidget extends StatelessWidget {
  // Exercis exercis =
      // Exercis(name: "Chest", imgPath: "assets/exercises_cover/chest.png");
  final Exercis exercis;
  const ExercisWidget({
    super.key,
    required this.exercis
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 230.0,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(exercis.imgPath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
            )
                ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text("${exercis.name} Exercises",
                    style: const TextStyle(
                      fontFamily: "CaesarDressing",
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
