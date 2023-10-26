import 'package:fitupia/workout/workout_widgets/exercis_widget.dart';
import 'package:fitupia/workout/list_of_exercises/list_of_exercises.dart';
import 'package:flutter/material.dart';

class CardioScreen extends StatelessWidget {
  static const String routeName = "/cardio_screen";
  const CardioScreen(this.gender, {super.key});
  final gender;


  @override
  Widget build(BuildContext context) {
    return ExercisWidget(exercis: ListOfExercises(gender)[6]);
  }
}