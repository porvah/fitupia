import 'package:first_app/presentation/helper/hand_Book_category.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/notebook_card.dart';
import 'package:flutter/material.dart';

class NoteBookScreen extends StatelessWidget {
  static const String routeName = '/notebook_screen';

  const NoteBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'HandBook',
        Colors.black,
        const Color.fromARGB(255, 190, 199, 206),
      ),
      body: ListView.builder(
        itemCount: handbookCards.length,
        itemBuilder: (ctx, index) {
          return NoteBookCard(card: handbookCards[index]);
        },
      ),
    );
  }
}
