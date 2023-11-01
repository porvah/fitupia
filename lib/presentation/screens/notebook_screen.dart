import 'package:first_app/presentation/screens/food_screen.dart';
import 'package:first_app/notebook_card.dart';
import 'package:flutter/material.dart';

class NoteBookScreen extends StatelessWidget {
  static const String routeName = '/notebook_screen';

  const NoteBookScreen({super.key});

  final List<List<dynamic>> noteCard = const [
    [
      'List of ingredients and\ncalorie count',
      'images/food.png',
      FoodScreen.routeName,
    ],
    [
      'Sports nutrition and\nvitamin',
      'images/nutrition3.png',
      routeName,
    ],
    [
      'Drinks',
      'images/drinks1.png',
      routeName,
    ],
    [
      'encyclopedia',
      'images/encyclopedia1.png',
      routeName,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 190, 199, 206),
        title: const Text(
          'HandBook',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: noteCard.length,
          itemBuilder: (context, index) {
            return NoteBookCard(
                title: noteCard[index][0],
                imgPath: noteCard[index][1],
                screenName: noteCard[index][2]);
          }),
    );
  }
}
