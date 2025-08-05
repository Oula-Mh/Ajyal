import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/Function/validation.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_buttom_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_field.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginFormStudent extends StatelessWidget {
  const LoginFormStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFail) {
          customAlert(context, state.errMessage, () {
            Navigator.of(context).pop();
          });
        } else if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.configPage);
        }
      },
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return Form(
          key: cubit.formKeyLogin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                baseText: "كلمة المرور",
                isPassword: true,
                passToggle: true,
                controller: cubit.passWordController,
                keyboardType: TextInputType.text,
                icon: Icons.lock_outline,
                validator: (val) {
                  return validInput(val!, 8, 100, "password");
                },
              ),
              CustomTextField(
                baseText: " الكود الخاص بك :",
                isPassword: false,
                controller: cubit.codeController,
                keyboardType: TextInputType.text,
                validator: (val) {
                  return validInput(val!, 8, 8, "password");
                },
              ),
              state is LoginLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustomAuthBttn(
                    onPressed: () {
                      cubit.login();
                    },
                    bttnText: "تسجيل الدخول",
                  ),
              CustomTextButtomAuth(
                one: "ليس لديك حساب ؟",
                tow: "  إنشاء حساب",
                onTap: () {
                  GoRouter.of(
                    context,
                  ).pushReplacement(AppRouter.checkStudentPage);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
