import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/Function/validation.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_text_field.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Custom/Custom_ui.dart/gradient_background_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GradientBackgroundWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 55),
              Text(" أهلاً وسهلاً .. !", style: Styles.largeWhite),
              SizedBox(height: 10),
              Text("تسجيل الدخول ", style: Styles.meduimGray),
              SizedBox(height: 24),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white1,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 26,
                      right: 26,
                      top: 50,
                      bottom: 10,
                    ),
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFail) {
                          customAlert(context, state.errMessage, () {
                            Navigator.of(context).pop();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errMessage)),
                          );
                        } else if (state is LoginSuccess) {
                          // تأجيل التنقل إلى ما بعد نهاية الـ build
                          Future.microtask(() {
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.homePage);
                          });
                        }
                      },
                      builder: (context, state) {
                        final cubit = LoginCubit.get(context);
                        return SingleChildScrollView(
                          child: LoginForm(cubit: cubit, state: state),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final LoginCubit cubit;
  final LoginState state;
  const LoginForm({super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKeyLogin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("كلمة المرور : ", style: Styles.meduimBlack),
          SizedBox(height: 8),
          CustomTextField(
            isPassword: true,
            passToggle: true,
            controller: cubit.passWordController,
            keyboardType: TextInputType.text,
            icon: Icons.lock_outline,
            validator: (val) {
              return validInput(val!, 8, 100, "password");
            },
          ),
          SizedBox(height: 31),
          Text(" الكود الخاص بك : ", style: Styles.meduimBlack),
          SizedBox(height: 8),
          CustomTextField(
            isPassword: false,
            controller: cubit.codeController,
            keyboardType: TextInputType.text,
            validator: (val) {
              return validInput(val!, 8, 8, "password");
            },
          ),
          SizedBox(height: 50),
          state is LoginLoading
              ? Center(child: CircularProgressIndicator())
              : CustomAuthBttn(
                onPressed: () {
                  cubit.login();
                },
                bttnText: "تسجيل الدخول",
              ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ليس لديك حساب ؟"),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).pushReplacement(AppRouter.checkStudentPage);
                },
                child: Text(
                  "  إنشاء حساب",
                  style: TextStyle(color: AppColor.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
