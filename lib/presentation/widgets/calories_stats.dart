import 'package:first_app/logic/read_meal_cubit/read_meal_cubit.dart';
import 'package:first_app/models/nutrition_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_nutritions.dart';
import 'calories_indicator.dart';

class CaloriesStats extends StatelessWidget {
  final int BMR;
  final Map<String, int> DRI;
  const CaloriesStats({Key? key, required this.BMR, required this.DRI})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadMealCubit, ReadMealState>(
      builder: (context, state) {
        var reg = BlocProvider.of<ReadMealCubit>(context);
        int took = reg.getAllCalories().toInt();
        int total = BMR;
        int left = total - took;

        return Column(
          children: [
            CaloriesIndicator(took: took, left: left, total: total),
            const SizedBox(height: 8),
            AllNutritions(nutritions: _getNutritions(reg))
          ],
        );
      },
    );
  }

  List<NutritionModel> _getNutritions(ReadMealCubit reg) {
    return [
      NutritionModel(
        title: 'Proteins',
        current: reg.getAllProeins().toInt(),
        target: DRI['Protein']!,
        color: Colors.green,
      ),
      NutritionModel(
        title: 'Carbs',
        current: reg.getAllCarbs().toInt(),
        target: DRI['Carbs']!,
        color: Colors.amber,
      ),
      NutritionModel(
        title: 'Fat',
        current: reg.getAllFat().toInt(),
        target: DRI['Fats']!,
        color: Colors.purple,
      ),
      NutritionModel(
        title: 'Fibers',
        current: reg.getAllFibers().toInt(),
        target: DRI['Fiber']!,
        color: const Color.fromRGBO(21, 101, 192, 1),
      ),
    ];
  }
}
