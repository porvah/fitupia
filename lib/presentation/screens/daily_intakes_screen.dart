import 'package:first_app/logic/read_meal_cubit/read_meal_cubit.dart';
import 'package:first_app/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/appbar.dart';
import '../widgets/meal_widget.dart';

class DailyIntakesScreen extends StatelessWidget {
  static const String routeName = '/daily_intake';

  const DailyIntakesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Today\'s Intakes', Colors.white, Colors.amber),
      body: SafeArea(
        child: BlocBuilder<ReadMealCubit, ReadMealState>(
          builder: (context, state) {
            if (state is ReadMealStateEmpty) {
              return _buildEmptyScreen();
            } else {
              return _buildMeals(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildEmptyScreen() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "No meals added today!",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMeals(BuildContext context) {
    List<MealModel> meals = BlocProvider.of<ReadMealCubit>(context).meals;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return MealWidget(
                mealModel: meals[index],
                buttonTitle: 'Delete',
                icon: Icons.delete_forever,
                onPressed: () async {
                  await _deleteMeal(context, meals[index]);
                },
              );
            },
          ),
        ),
        _buildAllCalories(context),
      ],
    );
  }

  Widget _buildAllCalories(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 195, 147, 5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'All Calories: ',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            '${_getAllCalories(context).toStringAsFixed(2)} cal',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
    );
  }

  double _getAllCalories(BuildContext context) {
    double res = 0.0;

    var meals = BlocProvider.of<ReadMealCubit>(context).meals;
    for (var meal in meals) {
      res += meal.cals;
    }

    return res;
  }

  Future<void> _deleteMeal(BuildContext context, MealModel mealModel) async {
    await BlocProvider.of<ReadMealCubit>(context).deleteMeal(mealModel);
  }
}
