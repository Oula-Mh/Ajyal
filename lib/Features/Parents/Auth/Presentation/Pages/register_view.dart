import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Custom/Custom_ui.dart/gradient_background_widget.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_container_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_buttom_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_field.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_header_auth.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GradientBackgroundWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeaderAuth(text: "تسجيل حساب جديد"),
              CustomContainerAuth(
                child: SingleChildScrollView(child: RegisterForm()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = RegisterParentCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          baseText: "اسم المستخدم :",
          icon: Icons.person,
          keyboardType: TextInputType.text,
          hint: "ادخل اسمك",
          controller: cubit.nameController,
        ),

        CustomTextField(
          baseText: "رقم الهاتف :",
          icon: Icons.phone,
          keyboardType: TextInputType.phone,
          hint: "ادخل رقم هاتفك",
          controller: cubit.phoneController,
        ),

        CustomTextField(
          baseText: "كلمة المرور :",
          icon: Icons.lock_outline,
          keyboardType: TextInputType.text,
          hint: "ادخل كلمة المرور",
          isPassword: true,
          passToggle: true,
          controller: cubit.passowrdController,
        ),

        CustomTextField(
          baseText: "تأكيد كلمة المرور :",
          icon: Icons.lock_outline,
          keyboardType: TextInputType.text,
          hint: "أكد كلمة المرور :",
          isPassword: true,
          passToggle: true,
          controller: cubit.confirmPassowrdController,
        ),

        CustomAuthBttn(
          onPressed: () {
            cubit.printit();
            GoRouter.of(context).push(
              AppRouter.qrScannerPage,
              extra: {
                "name": cubit.nameController.text,
                "password": cubit.passowrdController.text,
                "confirm": cubit.confirmPassowrdController.text,
                "number": cubit.phoneController.text,
              },
            );
          },
          bttnText: 'التالي',
        ),

        CustomTextButtomAuth(
          one: "لديك حساب مسبقاً ؟  ",
          tow: "نعم",
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.parentLogin);
          },
        ),
      ],
    );
  }
}
