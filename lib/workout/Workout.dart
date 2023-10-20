import 'package:fitupia/workout/Exercis.dart';
import 'package:fitupia/workout/exercis_widget.dart';
import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  Workout({super.key});

List<Exercis> exercises = [
    Exercis(name: "Chest", imgPath: "assets/exercises_cover/chest.png"),
    Exercis(name: "Back", imgPath: "assets/exercises_cover/back.png"),
    Exercis(name: "Legs", imgPath: "assets/exercises_cover/leg.png"),
    Exercis(name: "shoulders", imgPath: "assets/exercises_cover/shoulders.png"),
    Exercis(name: "Arms", imgPath: "assets/exercises_cover/arm.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFC0D1EF),
          body: ListView(
            children: exercises.map((e) => ExercisWidget(exercis: e)).toList(),
          )
          ),
    );
  }
}


