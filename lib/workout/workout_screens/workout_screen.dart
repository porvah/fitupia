import 'package:fitupia/workout/list_of_exercises/list_of_exercises.dart';
import 'package:fitupia/workout/workout_classes/card_content.dart';
import 'package:flutter/material.dart';
import 'package:fitupia/workout/workout_widgets/card_button_widget.dart';

class WorkoutScreen extends StatelessWidget {
  static const String routeName = "/workout_screen";
  
final gender;
const WorkoutScreen(this.gender, {super.key});



  @override
  Widget build(BuildContext context) {
    List<CardContent> exercises = ListOfExercises(gender);
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFC0D1EF),
          body: ListView(
            children: exercises.map((e) => CardButtonWidget(card: e, route: '/${e.name.toLowerCase()}_screen', gender: gender,)).toList(),
          )
          ),
    );
  }
}


