part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterCheckSuccess extends RegisterState {
  final CheckStudentInfoModel model;

  RegisterCheckSuccess({required this.model});
}

final class RegisterCheckLoading extends RegisterState {}

final class RegisterCheckFail extends RegisterState {
  final String errMessage;

  RegisterCheckFail({required this.errMessage});
}

final class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess({required this.message});
}

final class RegisterLoading extends RegisterState {}

final class RegisterFail extends RegisterState {
  final String errMessage;

  RegisterFail({required this.errMessage});
}
