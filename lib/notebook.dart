import 'package:first_app/foods.dart';
import 'package:first_app/notebook_card.dart';
import 'package:flutter/material.dart';

class NoteBook extends StatefulWidget {
  const NoteBook({super.key});

  @override
  State<NoteBook> createState() => _NoteBookState();
}

class _NoteBookState extends State<NoteBook> {
  final List<List<dynamic>> noteCard = const [
    ['List of ingredients and\ncalorie count', 'images/food.png', Food()],
    ['Sports nutrition and\nvitamin', 'images/nutrition3.png', NoteBook()],
    ['Drinks', 'images/drinks1.png', NoteBook()],
    ['encyclopedia', 'images/encyclopedia1.png', NoteBook()],
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
            return noteBookCard(
                title: noteCard[index][0],
                imgPath: noteCard[index][1],
                screenName: noteCard[index][2]);
          }),
    );
  }
}
