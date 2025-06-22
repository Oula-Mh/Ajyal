import 'package:ajyal/Features/Parents/Auth/data/repos/login/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginParentCubit extends Cubit<LoginParentState> {
  LoginParentCubit(this.loginParentRepo) : super(LoginParentInitial());
  final LoginParentRepo loginParentRepo;

  static LoginParentCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formKeyLogin = GlobalKey();

  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> login() async {
    if (formKeyLogin.currentState!.validate()) {
      emit(LoginParentLoading());
      var result = await loginParentRepo.login({
        "phone_number": phone.text,
        "password": password.text,
      });
      result.fold(
        (failure) {
          emit(LoginParentFailure(failure.errorMessage));
        },
        (x) {
          emit(LoginParentSuccess());
        },
      );
    }
  }
}
