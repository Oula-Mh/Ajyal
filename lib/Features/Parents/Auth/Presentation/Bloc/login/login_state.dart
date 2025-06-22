part of 'login_cubit.dart';

@immutable
abstract class LoginParentState {}

@override
List<Object> get props => [];

class LoginParentInitial extends LoginParentState {}

class LoginParentLoading extends LoginParentState {}

class LoginParentFailure extends LoginParentState {
  final String errMessage;
  LoginParentFailure(this.errMessage);
}

class LoginParentSuccess extends LoginParentState {}
