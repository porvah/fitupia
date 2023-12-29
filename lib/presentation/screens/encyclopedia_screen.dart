import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class EncyclopediaScreen extends StatelessWidget {
  static const String routeName = '/encyclopedia_screen';

  final List<List<String>> questions = const [
    [
      'How often should I exercise?',
      'It depends on your goal. But it\'s recommended to exercise three to four workouts each week.',
    ],
    [
      'How long should my workouts be?',
      'Again, this depends on what works for your lifestyle. For adults, the World Health Organisation recommends at least 150-300 minutes of moderate-intensity aerobic physical activity, or at least 75-150 minutes each week of vigorous-intensity aerobic physical activity.',
    ],
    [
      'Do I need to warm up before my workouts?',
      'We know it can be tempting to get straight into it, especially if you\'re short on time, but a proper warm-up is really important.'
    ],
  ];

  const EncyclopediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Encyclopedia',
        Colors.white,
        Colors.brown,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (ctx, index) {
            return QuestionWidget(
              question: questions[index][0],
              answer: questions[index][1],
            );
          },
        ),
      ),
    );
  }
}
