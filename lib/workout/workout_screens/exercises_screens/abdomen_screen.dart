import 'package:fitupia/workout/workout_widgets/exercis_widget.dart';
import 'package:fitupia/workout/list_of_exercises/list_of_exercises.dart';
import 'package:flutter/material.dart';

class AbdomenScreen extends StatelessWidget {
  static const String routeName = "/abdomen_screen";

  const AbdomenScreen(this.gender, {super.key});
  final gender;
  @override
  Widget build(BuildContext context) {
    return ExercisWidget(exercis: ListOfExercises(gender)[0]);
  }
}