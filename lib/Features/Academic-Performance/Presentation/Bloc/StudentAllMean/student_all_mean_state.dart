part of 'student_all_mean_cubit.dart';

sealed class StudentAllMeanState {}

final class StudentAllMeanInitial extends StudentAllMeanState {}

final class StudentAllMeanLoading extends StudentAllMeanState {}

final class StudentAllMeanSuccess extends StudentAllMeanState {
  final AnalysisAverageModel model;

  StudentAllMeanSuccess({required this.model});
}

final class StudentAllMeanFail extends StudentAllMeanState {
  final String errMessage;

  StudentAllMeanFail({required this.errMessage});
}
