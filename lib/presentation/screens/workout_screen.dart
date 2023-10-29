import 'package:flutter/material.dart';

import '../helper/exercises.dart';
import '../widgets/exercise_card.dart';

class WorkoutScreen extends StatelessWidget {
  static const String routeName = '/workout_screen';

  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (ctx, index) {
            return ExerciseCard(card: exercises[index]);
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFBED8ED),
      leading: const BackButton(
        color: Color(0xFF455766),
      ),
      title: const Text(
        "Workout",
        style: TextStyle(
          color: Color(0xFF455766),
        ),
      ),
    );
  }
}
