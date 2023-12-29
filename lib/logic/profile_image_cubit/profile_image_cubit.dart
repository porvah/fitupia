import 'dart:typed_data';

import 'package:first_app/models/user_data.dart';
import 'package:first_app/presentation/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageStateInitial());

  Future<void> saveProfileImage(UserData user, Uint8List imageData) async {
    final box = Hive.box(kImagesBox);

    await box.put(user.key, imageData);
  }

  Future<Uint8List?> getProfileImage(UserData user) async {
    final box = Hive.box(kImagesBox);

    return await box.get(user.key);
  }
}
