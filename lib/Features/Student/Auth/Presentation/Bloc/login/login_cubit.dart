import 'package:ajyal/Features/Student/Auth/Data/repos/student_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final StudentAuthRepo studentRepo;
  LoginCubit(this.studentRepo) : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final passWordController = TextEditingController();
  final codeController = TextEditingController();

  GlobalKey<FormState> formKeyLogin = GlobalKey();

  Future<void> login() async {
    if (formKeyLogin.currentState!.validate()) {
      emit(LoginLoading());
      final response = await studentRepo.login({
        "password": passWordController.text,
        "access_code": codeController.text,
      });
      if (isClosed) return;

      response.fold(
        (err) {
          if (!isClosed) emit(LoginFail(errMessage: err.errorMessage));
        },
        (success) {
          if (!isClosed) emit(LoginSuccess(message: success));
        },
      );
    }
  }
}
