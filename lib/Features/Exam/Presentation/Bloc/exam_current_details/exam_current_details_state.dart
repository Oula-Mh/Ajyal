part of 'exam_current_details_cubit.dart';

@immutable
abstract class ExamCurrentDetailsState {}

class ExamCurrentDetailsInitial extends ExamCurrentDetailsState {}

final class ExamCurrentDetailsLoading extends ExamCurrentDetailsState {}

final class ExamCurrentDetailsSuccess extends ExamCurrentDetailsState {
  final ExamCurrentDetailsModel examCurrentDetailsModel;

  ExamCurrentDetailsSuccess({required this.examCurrentDetailsModel});
}

final class ExamCurrentDetailsFailure extends ExamCurrentDetailsState {
  final String errMsg;
  ExamCurrentDetailsFailure({required this.errMsg});
}
