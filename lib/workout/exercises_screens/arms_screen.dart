import 'package:fitupia/workout/exercises_widgets/exercis_widget.dart';
import 'package:fitupia/workout/list_of_exercises/list_of_exercises.dart';
import 'package:flutter/material.dart';

class arms_screen extends StatelessWidget {
  static const String routeName = "/arms_screen";
  const arms_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExercisWidget(exercis: ListOfExercises()[4]);
  }
}