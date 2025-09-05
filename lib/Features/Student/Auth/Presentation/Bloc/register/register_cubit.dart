import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/check_student_info_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/repos/student_auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final StudentAuthRepo studentRepo;
  RegisterCubit(this.studentRepo) : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final codeController = TextEditingController();

  final passWordController = TextEditingController();
  final rePassWordController = TextEditingController();

  // void printregister() {
  //   print(
  //     "firstName : ${firstNameController.text}\n lastName : ${lastNameController.text}\n code : ${codeController.text}\n",
  //   );
  //   emit(RegisterCheckSuccess());
  // }

  Future<void> checkStudent() async {
    emit(RegisterCheckLoading());
    final response = await studentRepo.checkStudent({
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "access_code": codeController.text,
    });
    if (isClosed) return;

    response.fold(
      (err) {
        if (!isClosed) emit(RegisterCheckFail(errMessage: err.errorMessage));
      },
      (infoModel) {
        if (!isClosed) emit(RegisterCheckSuccess(model: infoModel));
      },
    );
  }

  Future<void> register(String userId, String acccessCode) async {
    emit(RegisterLoading());
    final response = await studentRepo.register({
      "user_id": userId,
      "access_code": acccessCode,
      "password": passWordController.text,
      "password_confirmation": rePassWordController.text,
      "fcm_token": getit<CacheHelper>().getData(key: "fcm") ?? "",
    });
    if (isClosed) return;

    response.fold(
      (err) {
        if (!isClosed) emit(RegisterFail(errMessage: err.errorMessage));
      },
      (message) {
        if (!isClosed) emit(RegisterSuccess(message: message));
      },
    );
  }
}
