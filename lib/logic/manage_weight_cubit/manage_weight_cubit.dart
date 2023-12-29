import 'package:first_app/models/state_item.dart';
import 'package:first_app/presentation/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

part 'manage_weight_state.dart';

class ManageWeightCubit extends Cubit<ManageWeightState> {
  ManageWeightCubit() : super(ManageWeightStateInitial());

  List<StateItem> allWeights = [];
  Future<void> addWeight(StateItem item) async {
    emit(ManageWeightStateLoading());

    try {
      var stateBox = Hive.box<StateItem>(kStateBox);
      await stateBox.add(item);

      allWeights = stateBox.values.toList();

      emit(ManageWeightStateSuccess());
    } catch (e) {
      emit(ManageWeightStateFailure(e.toString()));
    }
  }

  Future<void> deleteWeight(StateItem item) async {
    await item.delete();
    getAllWeights();
  }

  void getAllWeights() {
    var stateBox = Hive.box<StateItem>(kStateBox);
    allWeights = stateBox.values.toList();
  }
}
