part of 'teacher_adv_cubit.dart';

sealed class TeacherAdvState {}

final class TeacherAdvInitial extends TeacherAdvState {}

final class TeacherAdvSuccess extends TeacherAdvState {
  final AdvPaginationModel model;
  TeacherAdvSuccess({required this.model});
}

final class TeacherAdvLoading extends TeacherAdvState {}

final class TeacherAdvFailure extends TeacherAdvState {
  final String errMssg;

  TeacherAdvFailure({required this.errMssg});
}
