import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_data.dart';

class RegistrationCubit extends Cubit<UserData> {
  RegistrationCubit()
      : super(const UserData(
            name: '',
            gender: '',
            dateOfBirth: '',
            height: 0,
            weight: 0,
            goal: ''));

  void updateUserDate(UserData data) {
    emit(data);
  }
}
