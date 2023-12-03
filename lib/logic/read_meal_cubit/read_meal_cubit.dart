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
}
