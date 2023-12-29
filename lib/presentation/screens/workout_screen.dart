import 'package:first_app/presentation/screens/exercises_option_screen.dart';
import 'package:first_app/presentation/screens/plan_option_screen.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  static const String routeName = '/workout_screen';

  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<Widget> listOptions = [
    const PlanScreen(),
    const ExercisesScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 17, 86, 142),
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white54,
        iconSize: 40,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_rounded), label: "Plan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_rounded), label: "Exercises"),
        ],
      ),
      body: listOptions[_currentIndex],
    );
  }
}
