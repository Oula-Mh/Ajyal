part of 'course_adv_cubit.dart';

sealed class CourseAdvState {}

final class CourseAdvInitial extends CourseAdvState {}

final class CourseAdvSuccess extends CourseAdvState {
  final AdvPaginationModel model;
  CourseAdvSuccess({required this.model});
}

final class AdvLoading extends CourseAdvState {}

final class AdvFailure extends CourseAdvState {
  final String errMssg;

  AdvFailure({required this.errMssg});
}
