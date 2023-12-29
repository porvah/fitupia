part of 'profile_image_cubit.dart';

abstract class ProfileImageState {}

class ProfileImageStateInitial extends ProfileImageState {}

class ProfileImageStateHaveImage extends ProfileImageState {
  final Uint8List curProfileImage;

  ProfileImageStateHaveImage(this.curProfileImage);
}

class ProfileImageStateLoading extends ProfileImageState {}

class ProfileImageStateNoImage extends ProfileImageState {}

class ProfileImageStateFailure extends ProfileImageState {
  final String errorMsg;

  ProfileImageStateFailure(this.errorMsg);
}
