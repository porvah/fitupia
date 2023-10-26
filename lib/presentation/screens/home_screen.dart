import 'package:flutter/material.dart';
import "../themes/appbar.dart";
import '../size_config/size_config.dart';
import '../widgets/home_card.dart';
import "dummy_screen.dart";

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  final List<List<String>> cards = const [
    [
      'Today\'s Calories',
      'assets/images/Firefly food.jpg',
      DummyScreen.routeName,
    ],
    [
      'Exercise',
      'assets/images/Firefly exercise.jpg',
      DummyScreen.routeName,
    ],
    [
      'Track Your progress',
      'assets/images/Firefly calendar.jpg',
      DummyScreen.routeName,
    ]
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: appBar(const Color.fromARGB(255, 70, 163, 240), context),
      drawer: drawer(const Color.fromARGB(255, 1, 76, 138),
          Image.asset('assets/images/poseidon.png'), context),
      body: _buildListCards(),
    );
  }

  ListView _buildListCards() {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (ctx, index) {
        return HomeCard(
          title: cards[index][0],
          imgPath: cards[index][1],
          screenName: cards[index][2],
        );
      },
    );
  }
}
