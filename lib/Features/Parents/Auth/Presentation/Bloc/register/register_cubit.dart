import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/register/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterParentCubit extends Cubit<RegisterParentState> {
  RegisterParentCubit(this.registerParentRepo) : super(RegisterParentInitial());

  final RegisterParentRepo registerParentRepo;

  static RegisterParentCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passowrdController = TextEditingController();
  final TextEditingController confirmPassowrdController =
      TextEditingController();

  Future<void> register(
    String studentIdQr,
    String name,
    String password,
    String rePassword,
    String number,
  ) async {
    emit(RegisterParentLoading());
    var result = await registerParentRepo.register({
      "name": name,
      "phone_number": number,
      "password": password,
      "password_confirmation": rePassword,
      "student_id_qr": studentIdQr,
      "fcm_token": getit<CacheHelper>().getData(key: "fcm") ?? "",
    });
    result.fold(
      (failure) {
        emit(RegisterParentFailure(failure.errorMessage));
      },
      (x) {
        emit(RegisterParentSuccess());
      },
    );
  }

  void printit() {
    print(
      "${nameController.text} \n ${passowrdController.text} \n ${confirmPassowrdController.text} \n }",
    );
  }
}
