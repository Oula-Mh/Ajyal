import 'package:ajyal/Features/Parents/Auth/data/repos/register/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterParentCubit extends Cubit<RegisterParentState> {
  RegisterParentCubit(this.registerParentRepo) : super(RegisterParentInitial());

  final RegisterParentRepo registerParentRepo;

  static RegisterParentCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController passowrd = TextEditingController();
  final TextEditingController confirmPassowrd = TextEditingController();

  Future<void> register(String studentIdQr) async {
    emit(RegisterParentLoading());
    var result = await registerParentRepo.register({
      "name": name.text,
      "phone_number": phone.text,
      "password": passowrd.text,
      "password_confirmation": confirmPassowrd.text,
      "student_id_qr": studentIdQr,
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
}
