import 'package:first_app/models/meal_model.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_sheet.dart';

class MealWidget extends StatelessWidget {
  final MealModel mealModel;

  const MealWidget({required this.mealModel, super.key});

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
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            mealModel.name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.local_fire_department_sharp,
              color: Colors.amber,
            ),
            Text(
              '${mealModel.cals} cal - ${mealModel.weight} G',
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
      onPressed: () {
        _openBottomSheet(context);
      },
      icon: const Icon(Icons.add),
      label: const Text(
        'Add',
        style: TextStyle(fontSize: 16),
      ),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.brown[100],
        foregroundColor: Colors.brown[700],
        padding: const EdgeInsets.all(12),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return CustomBottomSheet(meal: mealModel);
        });
  }
}
