import 'package:first_app/presentation/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user_data.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  var curUser = UserData(
    name: '',
    gender: '',
    dateOfBirth: '',
    height: 0,
    weight: 0,
    goal: '',
  );

  void updateUserDate(UserData data) {
    curUser = data;
  }

  Future<void> registerUser() async {
    emit(RegistrationLoading());

    try {
      var userBox = Hive.box<UserData>(kUserBox);
      await userBox.add(curUser);

      emit(RegistrationSuccess());
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }

  Future<void> deleteUser() async {
    await curUser.delete();
    curUser = UserData(
      name: '',
      gender: '',
      dateOfBirth: '',
      height: 0,
      weight: 0,
      goal: '',
    );
    emit(RegistrationInitial());
  }
}
