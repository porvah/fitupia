import 'package:first_app/home_card.dart';
import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  final List<List<dynamic>> cards = const [
    ['Dairy products', 'images/dairy1.png', Food()],
    ['Chicken and other poultry', 'images/chicken1.png', Food()],
    ['Meats, pork, beef', 'images/meat1.png', Food()],
    ['Fish, seafood, canned fish', 'images/fish1.png', Food()],
    ['Eggs, cheese', 'images/eggsandcheese1.png', Food()],
    ['Vegetables, olives', 'images/vegetables1.png', Food()],
    ['Bread, flour and pasta', 'images/Bread1.png', Food()],
    ['Nuts, seeds', 'images/nuts2.png', Food()],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of ingradients'),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return HomeCard(
                  title: cards[index][0],
                  imgPath: cards[index][1],
                  screenName: cards[index][2]);
            }));
  }
}
