import 'package:first_app/models/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit() : super(AddMealStateInitial());

  Future<void> addMeal(MealModel meal) async {
    return;
  }
}
