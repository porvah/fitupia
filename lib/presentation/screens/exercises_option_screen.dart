import 'package:first_app/presentation/helper/exercises.dart';
import 'package:first_app/presentation/widgets/exercise_card.dart';
import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          backgroundColor: Color(0xFFBED8ED),
          leading: BackButton(
            color: Color(0xFF455766),
          ),
          title: Text(
            "Workout",
              style: TextStyle(
                color: Color(0xFF455766),
              ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ExerciseCard(card: exercises[index]);
            },
            childCount: exercises.length,
          ),
        ),
      ],
    );
  }
}

