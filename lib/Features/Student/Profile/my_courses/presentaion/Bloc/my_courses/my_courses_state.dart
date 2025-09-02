part of 'my_courses_cubit.dart';

@immutable
abstract class MyCoursesState {}

class MyCoursesInitial extends MyCoursesState {}

final class MyCoursesLoading extends MyCoursesState {}

final class MyCoursesSuccess extends MyCoursesState {
  final MyCoursesModel myCoursesModel;

  MyCoursesSuccess({required this.myCoursesModel});
}

final class MyCoursesFailure extends MyCoursesState {
  final String errMsg;
  MyCoursesFailure({required this.errMsg});
}
