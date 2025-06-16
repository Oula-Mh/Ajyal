import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_container_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_buttom_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_field.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_header_auth.dart';
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
              CustomTextHeaderAuth(text: "تسجيل الدخول"),
              CustomContainerAuth(
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    final cubit = LoginCubit.get(context);
                    return SingleChildScrollView(
                      child: LoginForm(cubit: cubit),
                    );
                  },
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
  const LoginForm({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          baseText: "كلمة المرور :",
          isPassword: true,
          passToggle: true,
          // controller: cubit.codeController,
          keyboardType: TextInputType.number,
          icon: Icons.lock_outline,
        ),

        CustomTextField(
          baseText: "الكود الخاص بك :",
          isPassword: false,
          // controller: cubit.passWordController,
          keyboardType: TextInputType.text,
        ),

        CustomAuthBttn(onPressed: () {}, bttnText: "تسجيل الدخول"),

        CustomTextButtomAuth(
          one: "ليس لديك حساب ؟  ",
          tow: "إنشاء حساب",
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.registerPage);
          },
        ),
      ],
    );
  }
}
