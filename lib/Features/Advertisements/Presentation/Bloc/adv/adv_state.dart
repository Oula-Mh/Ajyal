part of 'adv_cubit.dart';

sealed class AdvState {}

final class AdvInitial extends AdvState {}

final class CourseAdvSuccess extends AdvState {
  final AdvPaginationModel model;
  CourseAdvSuccess({required this.model});
}

final class TeacherAdvSuccess extends AdvState {
  final List<CourseAdvModel> mode;

  TeacherAdvSuccess({required this.mode});
}

final class PublicAdvSuccess extends AdvState {
  final List<CourseAdvModel> mode;

  PublicAdvSuccess({required this.mode});
}

final class AdvLoading extends AdvState {}

final class AdvFailure extends AdvState {
  final String errMssg;

  AdvFailure({required this.errMssg});
}
