import 'package:first_app/models/nutrition_model.dart';
import 'package:first_app/presentation/screens/daily_intakes_screen.dart';
import 'package:first_app/presentation/widgets/all_nutritions.dart';
import 'package:first_app/presentation/widgets/calories_indicator.dart';
import 'package:first_app/presentation/widgets/calories_stats.dart';
import 'package:flutter/material.dart';

import '../size_config/size_config.dart';
import 'notebook_screen.dart';
import '../themes/appbar.dart';
import '../widgets/custom_button.dart';

class DietScreen extends StatelessWidget {
  static const String routeName = '/diet_screen';

  const DietScreen({super.key});
  final List<NutritionModel> nutritions = const [
    NutritionModel(
      title: 'Fat',
      current: 42,
      target: 50,
      color: Colors.amber,
    ),
    NutritionModel(
      title: 'Proteins',
      current: 70,
      target: 200,
      color: Color.fromRGBO(211, 47, 47, 1),
    ),
    NutritionModel(
      title: 'Carbs',
      current: 92,
      target: 150,
      color: Colors.purple,
    ),
    NutritionModel(
      title: 'Fibers',
      current: 9,
      target: 40,
      color: Color.fromRGBO(21, 101, 192, 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Diet',
        Colors.white70,
        const Color.fromRGBO(234, 141, 11, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CaloriesStats(),
          SizedBox(height: SizeConfig.getProportionateScreenHeight(60)),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Column(
      children: [
        CaloriesIndicator(took: 1000, left: 500, total: 1500),
        const SizedBox(height: 8),
        AllNutritions(nutritions: nutritions)
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          title: 'Daily Intakes',
          onPressed: () {
            Navigator.of(context).pushNamed(DailyIntakesScreen.routeName);
          },
          icon: Icons.dinner_dining,
          color: Colors.white,
          backgroundColor: const Color.fromRGBO(234, 141, 11, 1),
          fontSize: 18,
        ),
        CustomButton(
          title: 'Add Meal',
          onPressed: () {
            Navigator.of(context).pushNamed(NoteBookScreen.routeName);
          },
          icon: Icons.add,
          color: Colors.white,
          backgroundColor: Colors.redAccent,
          fontSize: 18,
        ),
      ],
    );
  }
}
