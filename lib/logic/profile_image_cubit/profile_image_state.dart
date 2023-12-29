part of 'profile_image_cubit.dart';

abstract class ProfileImageState {}

class ProfileImageStateInitial extends ProfileImageState {}

class ProfileImageStateSuccess extends ProfileImageState {}

class ProfileImageStateLoading extends ProfileImageState {}

class ProfileImageStateFailure extends ProfileImageState {}
