part of 'exam_pre_cubit.dart';

@immutable
abstract class ExamPreState {}

class ExamPreInitial extends ExamPreState {}

final class ExamPreLoading extends ExamPreState {}

final class ExamPreSuccess extends ExamPreState {
  final List<ExamPreModel> examPreModel;

  ExamPreSuccess({required this.examPreModel});
}

final class ExamPreFailure extends ExamPreState {
  final String errMsg;
  ExamPreFailure({required this.errMsg});
}
