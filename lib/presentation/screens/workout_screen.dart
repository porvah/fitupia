import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/exercise_card.dart';
import 'package:flutter/material.dart';

import '../helper/exercises.dart';

class WorkoutScreen extends StatelessWidget {
  static const String routeName = '/workout_screen';

  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          'Workout', const Color(0xFF455766), const Color(0xFFBED8ED)),
      body: SafeArea(
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (ctx, index) {
            return CustomCard(card: exercises[index]);
          },
        ),
      ),
    );
  }
}
