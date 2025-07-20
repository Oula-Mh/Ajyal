part of 'course_cubit.dart';

sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final List<CourseModel> allcourses;

  CourseSuccess({required this.allcourses});
}

final class CourseFail extends CourseState {
  final String errMsg;

  CourseFail({required this.errMsg});
}

final class GetDetailsSuccess extends CourseState {
  final CourseDetailsModel model;

  GetDetailsSuccess({required this.model});
}
