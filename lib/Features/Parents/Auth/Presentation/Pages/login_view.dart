import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Custom/Custom_ui.dart/gradient_background_widget.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_container_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_buttom_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_field.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_header_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                child: SingleChildScrollView(child: LoginForm()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          baseText: "رقم الهاتف :",
          icon: Icons.phone,
          keyboardType: TextInputType.phone,
          hint: "ادخل رقم هاتفك",
        ),

        CustomTextField(
          baseText: "كلمة المرور :",
          icon: Icons.lock_outline,
          keyboardType: TextInputType.text,
          hint: "ادخل كلمة المرور",
          isPassword: true,
          passToggle: true,
        ),

        CustomAuthBttn(onPressed: () {}, bttnText: 'الدخول'),

        CustomTextButtomAuth(
          one: "ليس لديك حساب ؟  ",
          tow: "إنشاء حساب",
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.parentRgister);
          },
        ),
      ],
    );
  }
}
