import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final codeController = TextEditingController();

  final passWordController = TextEditingController();
  final rePassWordController = TextEditingController();

  void printregister() {
    print(
      "firstName : ${firstNameController.text}\n lastName : ${lastNameController.text}\n code : ${codeController.text}\n",
    );
    emit(RegisterCheckSuccess());
  }
}
