part of 'all_quizz_cubit_cubit.dart';

sealed class AllQuizzCubitState {}

final class AllQuizzCubitInitial extends AllQuizzCubitState {}

final class AllQuizzLoading extends AllQuizzCubitState {}

final class AllQuizzSuccess extends AllQuizzCubitState {
  final AllQuizzesModel model;

  AllQuizzSuccess({required this.model});
}

final class AllQuizzFail extends AllQuizzCubitState {
  final String errMessage;

  AllQuizzFail({required this.errMessage});
}
