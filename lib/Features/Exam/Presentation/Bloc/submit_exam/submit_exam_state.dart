part of 'submit_exam_cubit.dart';

@immutable
abstract class SubmitExamState {}

class SubmitExamInitial extends SubmitExamState {}

class SubmitExamLoading extends SubmitExamState {}

class SubmitExamFailure extends SubmitExamState {
  final String errMessage;
  SubmitExamFailure(this.errMessage);
}

class SubmitExamSuccess extends SubmitExamState {
  final int message;
  SubmitExamSuccess(this.message);
}
