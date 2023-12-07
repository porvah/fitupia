import 'package:first_app/logic/read_meal_cubit/read_meal_cubit.dart';
import 'package:first_app/models/nutrition_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_nutritions.dart';
import 'calories_indicator.dart';

class CaloriesStats extends StatelessWidget {
  const CaloriesStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadMealCubit, ReadMealState>(
      builder: (context, state) {
        var reg = BlocProvider.of<ReadMealCubit>(context);
        int took = reg.getAllCalories().toInt();
        int total = 1500;
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
        target: 200,
        color: Colors.green,
      ),
      NutritionModel(
        title: 'Carbs',
        current: reg.getAllCarbs().toInt(),
        target: 150,
        color: Colors.amber,
      ),
      NutritionModel(
        title: 'Fat',
        current: reg.getAllFat().toInt(),
        target: 50,
        color: Colors.purple,
      ),
      NutritionModel(
        title: 'Fibers',
        current: reg.getAllFibers().toInt(),
        target: 40,
        color: const Color.fromRGBO(21, 101, 192, 1),
      ),
    ];
  }
}
