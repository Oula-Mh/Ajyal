part of 'student_all_stddev_cubit.dart';

sealed class StudentAllStddevState {}

final class StudentAllStddevInitial extends StudentAllStddevState {}

final class StudentAllStddevLoading extends StudentAllStddevState {}

final class StudentAllStddevSuccess extends StudentAllStddevState {
  final AnalysisStddevModel model;

  StudentAllStddevSuccess({required this.model});
}

final class StudentAllStddevFail extends StudentAllStddevState {
  final String errMessage;

  StudentAllStddevFail({required this.errMessage});
}
