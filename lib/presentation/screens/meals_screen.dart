import 'package:first_app/models/meal_model.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/meal_widget.dart';
import 'package:flutter/material.dart';

import '../helper/meals.dart';
import '../widgets/custom_bottom_sheet.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName = '/meals_screen';
  final pagenameList = const [
    'Dairy product',
    'Meats and beef',
    'Fish',
    'Vegetables',
    'Bread and flour',
    'Nuts and seeds',
    'Drinks'
  ];
  const MealsScreen(this.toBeDisplayedList, {super.key});
  final int toBeDisplayedList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          pagenameList[toBeDisplayedList], Colors.white, Colors.green),
      body: SafeArea(
        child: ListView.builder(
          itemCount: meals[toBeDisplayedList].length,
          itemBuilder: (ctx, index) {
            return MealWidget(
              mealModel: meals[toBeDisplayedList][index],
              buttonTitle: 'Add',
              icon: Icons.add,
              onPressed: () =>
                  _openBottomSheet(context, meals[toBeDisplayedList][index]),
            );
          },
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context, MealModel mealModel) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return CustomBottomSheet(meal: mealModel);
        });
  }
}
