import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final String answer;

  const QuestionWidget({
    required this.question,
    required this.answer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuestion(),
        _buildAnswer(),
      ],
    );
  }

  Widget _buildQuestion() {
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Colors.brown[700],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Text(
        question,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAnswer() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 227, 179, 165),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Text(
        answer,
        style: const TextStyle(color: Colors.brown, fontSize: 20),
      ),
    );
  }
}
