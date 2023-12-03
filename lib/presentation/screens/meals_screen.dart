import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/meal_widget.dart';
import 'package:flutter/material.dart';

import '../helper/meals.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName = '/meals_screen';

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
