part of 'attendence_cubit.dart';

sealed class AttendenceState {}

final class AttendenceInitial extends AttendenceState {}

final class GetAllAttendenceDays extends AttendenceState {
  final CourseAbsenceModel model;

  GetAllAttendenceDays({required this.model});
}

final class GetAttendenceFail extends AttendenceState {
  final String errMessage;

  GetAttendenceFail({required this.errMessage});
}

final class Loading extends AttendenceState {}
