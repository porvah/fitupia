import 'package:first_app/presentation/widgets/exercis_of_bodypart_card.dart';
import 'package:flutter/material.dart';

import '../../models/card_content.dart';

class ExercisScreen extends StatelessWidget {
  final CardContent card;
  const ExercisScreen({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ExercisOfBodyPartCard(card: card),
        ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFBED8ED),
      leading: const BackButton(
        color: Color(0xFF455766),
      ),
      title: Text(
        card.name,
        style: const TextStyle(
          color: Color(0xFF455766),
        ),
      ),
    );
  }
}
