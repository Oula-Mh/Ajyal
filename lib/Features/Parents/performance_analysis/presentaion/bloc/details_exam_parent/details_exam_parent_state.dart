part of 'details_exam_parent_cubit.dart';

@immutable
abstract class DetailsExamParentState {}

class DetailsExamParentInitial extends DetailsExamParentState {}

final class DetailsExamParentLoading extends DetailsExamParentState {}

final class DetailsExamParentSuccess extends DetailsExamParentState {
  final ExamDetailsParentModel examDetailsParentModel;

  DetailsExamParentSuccess({required this.examDetailsParentModel});
}

final class DetailsExamParentFailure extends DetailsExamParentState {
  final String errMsg;
  DetailsExamParentFailure({required this.errMsg});
}
