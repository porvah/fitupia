import 'package:first_app/models/nutrition_model.dart';
import 'package:first_app/presentation/widgets/nutrition_widget.dart';
import 'package:flutter/material.dart';

class AllNutritions extends StatelessWidget {
  final List<NutritionModel> nutritions;

  const AllNutritions({
    required this.nutritions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: nutritions.map((nutrition) {
        return NutritionWidget(nutritionModel: nutrition);
      }).toList(),
    );
  }
}
