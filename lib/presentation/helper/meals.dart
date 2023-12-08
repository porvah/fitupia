import 'package:flutter/services.dart';

import '../../models/meal_model.dart';
import 'package:csv/csv.dart';

List<List<MealModel>> meals = [];

Future<void> prepareMeals() async {
  final String rawDairy =
      await rootBundle.loadString("assets/datasets/Dairy products.csv");
  final String rawMeat =
      await rootBundle.loadString("assets/datasets/Meat and poultry.csv");
  final String rawFish =
      await rootBundle.loadString("assets/datasets/Fish.csv");
  final String rawDrinks =
      await rootBundle.loadString("assets/datasets/Drinks.csv");
  final String rawNuts =
      await rootBundle.loadString("assets/datasets/Nuts.csv");
  final String rawVeges =
      await rootBundle.loadString("assets/datasets/Vegetabels.csv");
  final String rawBread =
      await rootBundle.loadString("assets/datasets/Bread, flour products.csv");
  List<String> datasets = [
    rawDairy,
    rawMeat,
    rawFish,
    rawVeges,
    rawBread,
    rawNuts,
    rawDrinks
  ];
  for (String data in datasets) {
    List<List<dynamic>> listData = const CsvToListConverter().convert(data);
    listData.remove(listData[0]);
    List<MealModel> mealList = [];
    for (List<dynamic> list in listData) {
      mealList.add(MealModel(
          name: list[0],
          cals: list[2] * 1.0,
          weight: list[1] * 1.0,
          protein: list[3] * 1.0,
          carbs: list[5] * 1.0,
          fat: list[4] * 1.0,
          fibers: 0.0));
    }
    meals.add(mealList);
  }
}
