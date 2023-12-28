import 'package:first_app/models/card_content.dart';
import 'package:first_app/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List<CardContent> cards;

  const CustomListView({required this.cards, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (ctx, index) {
        return HomeCard(card: cards[index]);
      },
    );
  }
}
