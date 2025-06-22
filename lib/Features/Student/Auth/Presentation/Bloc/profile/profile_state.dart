part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final StudentProfileModel model;

  ProfileSuccess({required this.model});
}

final class ProfileFail extends ProfileState {
  final String errorMessage;

  ProfileFail({required this.errorMessage});
}

final class LogoutDone extends ProfileState {}
