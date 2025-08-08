part of 'exam_current_cubit.dart';

@immutable
abstract class ExamCurrentState {}

class ExamCurrentInitial extends ExamCurrentState {}

final class ExamCurrentLoading extends ExamCurrentState {}

final class ExamCurrentSuccess extends ExamCurrentState {
  final List<ExamCurrentModel> examCurrentModel;

  ExamCurrentSuccess({required this.examCurrentModel});
}

final class ExamCurrentFailure extends ExamCurrentState {
  final String errMsg;
  ExamCurrentFailure({required this.errMsg});
}
