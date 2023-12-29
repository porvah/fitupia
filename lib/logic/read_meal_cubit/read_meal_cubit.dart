import 'package:first_app/models/meal_model.dart';
import 'package:first_app/presentation/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'read_meal_state.dart';

class ReadMealCubit extends Cubit<ReadMealState> {
  ReadMealCubit() : super(ReadMealStateInitial());

  List<MealModel> meals = [];

  void getMeals() {
    var mealBox = Hive.box<MealModel>(kMealBox);
    var mealsValues = mealBox.values.toList();

    if (mealsValues.isEmpty) {
      meals.clear();
      emit(ReadMealStateEmpty());
    } else {
      meals = mealsValues;
      emit(ReadMealStateFull());
    }
  }

  Future<void> deleteMeal(MealModel mealModel) async {
    await mealModel.delete();
    getMeals();
  }

  Future<void> clearMeals() async {
    var mealBox = Hive.box<MealModel>(kMealBox);
    await mealBox.clear();
    getMeals();
  }

  String? isMealExceeding(MealModel meal, int bmr, Map<String, int> dri) {
    if (getAllCalories() + meal.cals > bmr) {
      return 'Calories';
    } else if (getAllProeins() + meal.protein > dri['Protein']!) {
      return 'Protein';
    } else if (getAllCarbs() + meal.carbs > dri['Carbs']!) {
      return 'Carbs';
    } else if (getAllFat() + meal.fat > dri['Fats']!) {
      return 'Fats';
    }
    return null;
  }

  double getAllCalories() {
    double res = 0.0;
    for (MealModel meal in meals) {
      res += meal.cals;
    }
    return res;
  }

  double getAllProeins() {
    double res = 0.0;
    for (MealModel meal in meals) {
      res += meal.protein;
    }
    return res;
  }

  double getAllFat() {
    double res = 0.0;
    for (MealModel meal in meals) {
      res += meal.fat;
    }
    return res;
  }

  double getAllCarbs() {
    double res = 0.0;
    for (MealModel meal in meals) {
      res += meal.carbs;
    }
    return res;
  }

  double getAllFibers() {
    double res = 0.0;
    for (MealModel meal in meals) {
      res += meal.fibers;
    }
    return res;
  }
}
