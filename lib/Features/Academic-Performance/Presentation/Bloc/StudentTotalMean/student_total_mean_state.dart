part of 'student_total_mean_cubit.dart';

sealed class StudentTotalMeanState {}

final class StudentTotalMeanInitial extends StudentTotalMeanState {}

final class StudentTotalMeanLoading extends StudentTotalMeanState {}

final class StudentTotalMeanSuccess extends StudentTotalMeanState {
  final double studentTotalMean;

  StudentTotalMeanSuccess({required this.studentTotalMean});
}

final class StudentTotalMeanFail extends StudentTotalMeanState {
  final String errMessage;

  StudentTotalMeanFail({required this.errMessage});
}
