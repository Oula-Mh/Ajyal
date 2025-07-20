part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class StudentProfileSuccess extends ProfileState {
  final StudentProfileModel model;

  StudentProfileSuccess({required this.model});
}

final class TeacherProfileSuccess extends ProfileState {
  final TeacherProfileModel model;

  TeacherProfileSuccess({required this.model});
}

final class ProfileFail extends ProfileState {
  final String errorMessage;

  ProfileFail({required this.errorMessage});
}

final class LogoutDone extends ProfileState {}
