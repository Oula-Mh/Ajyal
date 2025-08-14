part of 'exam_pre_details_cubit.dart';

@immutable
abstract class ExamPreDetailsState {}

class ExamPreDetailsInitial extends ExamPreDetailsState {}

final class ExamPreDetailsLoading extends ExamPreDetailsState {}

final class ExamPreDetailsSuccess extends ExamPreDetailsState {
  final ExamPreDetailsModel examPreDetailsModel;

  ExamPreDetailsSuccess({required this.examPreDetailsModel});
}

final class ExamPreDetailsFailure extends ExamPreDetailsState {
  final String errMsg;
  ExamPreDetailsFailure({required this.errMsg});
}
