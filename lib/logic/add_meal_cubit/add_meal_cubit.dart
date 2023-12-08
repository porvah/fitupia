import 'package:first_app/models/meal_model.dart';
import 'package:first_app/presentation/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit() : super(AddMealStateInitial());

  Future<void> addMeal(MealModel meal) async {
    emit(AddMealStateLoading());

    try {
      var mealBox = Hive.box<MealModel>(kMealBox);
      await mealBox.add(meal);

      emit(AddMealStateSuccess());
    } catch (e) {
      emit(AddMealStateFailure(e.toString()));
    }
  }
}
