import 'package:fitupia/workout/list_of_exercises/list_of_exercises.dart';
import 'package:flutter/material.dart';
import 'package:fitupia/workout/exercises_widgets/exercis_button_widget.dart';

class workout_screen extends StatelessWidget {
  static const String routeName = "/workout_screen";
  workout_screen({super.key});

List exercises = ListOfExercises();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFC0D1EF),
          body: ListView(
            children: exercises.map((e) => ExercisButtonWidget(exercis: e)).toList(),
          )
          ),
    );
  }
}


