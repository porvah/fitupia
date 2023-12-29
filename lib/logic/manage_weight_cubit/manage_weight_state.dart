part of 'manage_weight_cubit.dart';

abstract class ManageWeightState {}

class ManageWeightStateInitial extends ManageWeightState {}

class ManageWeightStateSuccess extends ManageWeightState {}

class ManageWeightStateLoading extends ManageWeightState {}

class ManageWeightStateFailure extends ManageWeightState {
  final String errorMessage;

  ManageWeightStateFailure(this.errorMessage);
}
