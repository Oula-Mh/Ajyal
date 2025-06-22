part of 'register_cubit.dart';

@immutable
abstract class RegisterParentState {}

@override
List<Object> get props => [];

class RegisterParentInitial extends RegisterParentState {}

class RegisterParentLoading extends RegisterParentState {}

class RegisterParentFailure extends RegisterParentState {
  final String errMessage;
  RegisterParentFailure(this.errMessage);
}

class RegisterParentSuccess extends RegisterParentState {}
