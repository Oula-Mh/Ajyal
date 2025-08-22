part of 'student_link_cubit.dart';

sealed class StudentLinkState {}

final class StudentLinkInitial extends StudentLinkState {}

final class StudentLinkSuccessfully extends StudentLinkState {
  final String message;

  StudentLinkSuccessfully({required this.message});
}

final class StudentLinkLoading extends StudentLinkState {}

final class StudentLinkFail extends StudentLinkState {
  final String errMessage;

  StudentLinkFail({required this.errMessage});
}
