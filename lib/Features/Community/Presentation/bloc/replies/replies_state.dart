part of 'replies_cubit.dart';

abstract class RepliesState {}

class RepliesInitial extends RepliesState {}

class RepliesLoading extends RepliesState {}

class RepliesSuccess extends RepliesState {
  final RepliesModel repliesModel;
  RepliesSuccess({required this.repliesModel});
}

class RepliesFailure extends RepliesState {
  final String errMsg;
  RepliesFailure({required this.errMsg});
}
