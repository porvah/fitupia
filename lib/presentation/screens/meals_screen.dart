import 'package:first_app/models/meal_model.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/meal_widget.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName = '/meals_screen';

  final List<MealModel> meals = const [
    MealModel(
      name: 'Chicken',
      cals: 284,
      weight: 172,
      protein: 53.4,
      carbs: 0,
      fat: 6.2,
    ),
    MealModel(
      name: 'Chicken',
      cals: 284,
      weight: 172,
      protein: 53.4,
      carbs: 0,
      fat: 6.2,
    ),
    MealModel(
      name: 'Chicken',
      cals: 284,
      weight: 172,
      protein: 53.4,
      carbs: 0,
      fat: 6.2,
    ),
  ];

  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Meals', Colors.white, Colors.green),
      body: SafeArea(
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return MealWidget(mealModel: meals[index]);
          },
        ),
      ),
    );
  }
}
