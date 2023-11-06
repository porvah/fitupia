import 'package:first_app/models/card_content.dart';
import 'package:first_app/presentation/widgets/custom_listview.dart';
import 'package:flutter/material.dart';
import "../themes/appbar.dart";
import 'calendar_screen.dart';
import 'diet_screen.dart';
import 'workout_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  final List<CardContent> homeCards = const [
    CardContent(
      name: 'Today\'s Calories',
      imgPath: 'assets/images/Firefly food.jpg',
      routeName: DietScreen.routeName,
    ),
    CardContent(
      name: 'Exercise',
      imgPath: 'assets/images/Firefly exercise.jpg',
      routeName: WorkoutScreen.routeName,
    ),
    CardContent(
      name: 'Track Your progress',
      imgPath: 'assets/images/Firefly calendar.jpg',
      routeName: CalendarScreen.routeName,
    ),
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Fitupia',
        Colors.white70,
        const Color.fromARGB(255, 70, 163, 240),
        back: false,
      ),
      drawer: drawer(const Color.fromARGB(255, 1, 76, 138),
          Image.asset('assets/images/poseidon.png'), context),
      body: CustomListView(cards: homeCards),
    );
  }
}
