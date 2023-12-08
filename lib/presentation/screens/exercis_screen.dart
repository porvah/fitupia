import 'package:first_app/models/card_content.dart';
import 'package:first_app/presentation/widgets/exercis_of_bodypart_card.dart';
import 'package:flutter/material.dart';

class ExercisScreen extends StatelessWidget {
  final List<dynamic> data;
  final CardContent card;
  const ExercisScreen({super.key, required this.data, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => ExercisOfBodyPartCard(data: data[index]),
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
        style: TextStyle(
          color: Color(0xFF455766),
        ),
      ),
    );
  }
}
