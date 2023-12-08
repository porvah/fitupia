import 'package:first_app/models/meal_model.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:flutter/material.dart';

class MealWidget extends StatelessWidget {
  final MealModel mealModel;
  final String buttonTitle;
  final IconData icon;
  final VoidCallback onPressed;

  const MealWidget(
      {required this.mealModel,
      required this.buttonTitle,
      required this.icon,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.brown[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPanner(),
              _buildAddButton(context),
            ],
          ),
          const SizedBox(height: 20),
          _buildNutritions(),
        ],
      ),
    );
  }

  Widget _buildPanner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 6),
          constraints: BoxConstraints(
            maxWidth: SizeConfig.screenWidth * 0.65,
          ),
          child: Text(
            mealModel.name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.local_fire_department_sharp,
              color: Colors.amber,
            ),
            Text(
              '${mealModel.cals.toStringAsFixed(1)} cal - ${mealModel.weight} G',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNutritions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildNut('Protein', mealModel.protein, Colors.green),
        _buildNut('Carbs', mealModel.carbs, Colors.amber),
        _buildNut('Fat', mealModel.fat, Colors.purple),
        // _buildNut(
        //     'Fibers', mealModel.fibers, const Color.fromRGBO(21, 101, 192, 1)),
      ],
    );
  }

  Widget _buildNut(String title, double value, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 35,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        const SizedBox(width: 8.0),
        Column(
          children: [
            Text(
              value.toStringAsFixed(1),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        buttonTitle,
        style: const TextStyle(fontSize: 16),
      ),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.brown[100],
        foregroundColor: Colors.brown[700],
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
