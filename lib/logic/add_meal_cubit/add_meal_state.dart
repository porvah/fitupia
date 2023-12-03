part of 'add_meal_cubit.dart';

abstract class AddMealState {}

class AddMealStateInitial extends AddMealState {}

class AddMealStateLoading extends AddMealState {}

class AddMealStateSuccess extends AddMealState {}

class AddMealStateFailure extends AddMealState {
  final String errorMessage;

  AddMealStateFailure(this.errorMessage);
}
