import 'package:first_app/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  static const String routeName = '/food_screen';

  const FoodScreen({super.key});

  final List<List<dynamic>> cards = const [
    [
      'Dairy products',
      'assets/images/diet/dairy1.png',
      routeName,
    ],
    [
      'Chicken and other poultry',
      'assets/images/diet/chicken1.png',
      routeName,
    ],
    [
      'Meats, pork, beef',
      'assets/images/diet/meat1.png',
      routeName,
    ],
    [
      'Fish, seafood, canned fish',
      'assets/images/diet/fish1.png',
      routeName,
    ],
    [
      'Eggs, cheese',
      'assets/images/diet/eggsandcheese1.png',
      routeName,
    ],
    [
      'Vegetables, olives',
      'assets/images/diet/vegetables1.png',
      routeName,
    ],
    [
      'Bread, flour and pasta',
      'assets/images/diet/Bread1.png',
      routeName,
    ],
    [
      'Nuts, seeds',
      'assets/images/diet/nuts2.png',
      routeName,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingradients'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return HomeCard(
              title: cards[index][0],
              imgPath: cards[index][1],
              screenName: cards[index][2]);
        },
      ),
    );
  }
}
