part of 'student_link_cubit.dart';

sealed class StudentLinkState {}

final class StudentLinkInitial extends StudentLinkState {}

final class StudentLinkSuccessfully extends StudentLinkState {
  final String message;

  StudentLinkSuccessfully({required this.message});
}

final class LoadingState extends StudentLinkState {}

final class AllParentStuentLoaded extends StudentLinkState {
  final List<ParentStudentModel> listModel;

  AllParentStuentLoaded({required this.listModel});
}

final class GetParentInfo extends StudentLinkState {
  final String name;

  GetParentInfo({required this.name});
}

final class FailState extends StudentLinkState {
  final String errMessage;

  FailState({required this.errMessage});
}
