import 'package:ajyal/Features/Parents/Auth/data/repos/login/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ajyal/Core/utils/safe_cubit.dart'; // استيراد SafeCubit

part 'login_state.dart';

class LoginParentCubit extends SafeCubit<LoginParentState> {
  LoginParentCubit(this.loginParentRepo) : super(LoginParentInitial());

  final LoginParentRepo loginParentRepo;

  static LoginParentCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formKeyLogin = GlobalKey();

  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> login() async {
    if (formKeyLogin.currentState!.validate()) {
      safeEmit(LoginParentLoading());
      var result = await loginParentRepo.login({
        "phone_number": phone.text,
        "password": password.text,
      });
      result.fold(
        (failure) {
          safeEmit(LoginParentFailure(failure.errorMessage));
        },
        (x) {
          safeEmit(LoginParentSuccess());
        },
      );
    }
  }
}
