import 'package:first_app/presentation/helper/hand_Book_category.dart';
import 'package:first_app/presentation/screens/custom_meal_screen.dart';
import 'package:first_app/presentation/widgets/notebook_card.dart';
import 'package:flutter/material.dart';

class NoteBookScreen extends StatelessWidget {
  static const String routeName = '/notebook_screen';

  const NoteBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView.builder(
        itemCount: handbookCards.length,
        itemBuilder: (ctx, index) {
          return NoteBookCard(
            card: handbookCards[index],
            toBeDisplayedList: index,
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 190, 199, 206),
      title: const Text(
        "Hand Book",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      foregroundColor: Colors.black,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CustomMealScreen.routeName);
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}
