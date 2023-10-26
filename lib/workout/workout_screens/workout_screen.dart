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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            height: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFBED8ED),
                Color(0xFFc5dcef),
                Color(0xFFcbe0f1),
              ]),
            ),
            child: SafeArea(
              child: Center(
                child: ListTile(
                  leading: const BackButton(
                    color: Color(0xFF455766),
                  ),
                  trailing: LiteRollingSwitch(
                    value: true,
                    textOn: 'Male',
                    textOff: 'Female',
                    iconOn: Icons.male_rounded,
                    iconOff: Icons.female_rounded,
                    colorOn: Colors.blue,
                    colorOff: Colors.pink,
                    textSize: 16.0,
                    onChanged: (bool state) {
                      setState(() {
                        if(state) {
                          gender = "male";
                        } else {
                          gender = "female";
                        }
                      });
                    },
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                  ),
                  title: const Text(
                    "Exercises",
                    style: TextStyle(
                        color: Color(0xFF455766),
                        letterSpacing: 1.0,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "CaesarDressing"),
                  ),
                ),
              ),
            ),
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
