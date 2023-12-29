import 'dart:typed_data';

import 'package:first_app/models/user_data.dart';
import 'package:first_app/presentation/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageStateInitial());

  Uint8List? curProfileImage;

  Future<void> saveProfileImage(UserData user, Uint8List imageData) async {
    emit(ProfileImageStateLoading());

    try {
      final box = Hive.box(kImagesBox);

      await box.put(user.key, imageData);

      emit(ProfileImageStateHaveImage(imageData));
    } catch (e) {
      emit(ProfileImageStateFailure(e.toString()));
    }
  }

  Future<Uint8List?> getProfileImage(UserData user) async {
    emit(ProfileImageStateLoading());

    try {
      final box = Hive.box(kImagesBox);
      var img = await box.get(user.key);

      if (img == null) {
        emit(ProfileImageStateNoImage());
      } else {
        emit(ProfileImageStateHaveImage(img));
      }

      return img;
    } catch (e) {
      emit(ProfileImageStateFailure(e.toString()));
      return null;
    }
  }

  Future<void> deleteProfileImage(UserData user) async {
    emit(ProfileImageStateLoading());

    try {
      final box = Hive.box(kImagesBox);
      await box.delete(user.key);

      emit(ProfileImageStateNoImage());
    } catch (e) {
      emit(ProfileImageStateFailure(e.toString()));
    }
  }
}
