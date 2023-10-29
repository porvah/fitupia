import 'package:fitupia/workout/list_of_exercises/list_of_exercises.dart';
import 'package:flutter/material.dart';
import 'package:fitupia/workout/workout_widgets/card_button_widget.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class WorkoutScreen extends StatefulWidget {
  static const String routeName = "/workout_screen";

  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFBED8ED),
          centerTitle: true,
          title: const Text(
            "Exercises",
            style: TextStyle(
                color: Color(0xFF455766),
                letterSpacing: 1.0,
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
                fontFamily: "CaesarDressing"),
          ),
          leading: BackButton(
            color: Color(0xFF455766),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: ListOfExercises(gender)
              .map((e) => CardButtonWidget(
                    card: e,
                    route: '/${e.name.toLowerCase()}_screen',
                    gender: gender,
                  ))
              .toList(),
        ));
  }
}
