import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Custom/Custom_ui.dart/gradient_background_widget.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_container_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_buttom_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_field.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_header_auth.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    final cubit = RegisterCubit.get(context);
                    if (state is RegisterCheckSuccess) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            CheckStudentInfo(cubit: cubit),
                            SizedBox(height: 31),
                            PassWordForm(cubit: cubit),
                            CustomAuthBttn(onPressed: () {}, bttnText: "تأكيد"),
                          ],
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      child: CheckStudentForm(cubit: cubit),
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

class CheckStudentForm extends StatelessWidget {
  final RegisterCubit cubit;
  const CheckStudentForm({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          baseText: "الاسم الأول :",
          isPassword: false,
          // controller: cubit.firstNameController,
          keyboardType: TextInputType.text,
        ),

        CustomTextField(
          baseText: "الاسم الثاني :",
          isPassword: false,
          // controller: cubit.lastNameController,
          keyboardType: TextInputType.text,
        ),

        Text("الكود الخاص بالطالب : ", style: Styles.meduimBlack),
        Text(
          " * لا تشارك الكود الخاص بك مع الآخرين  ",
          style: TextStyle(color: AppColor.borderTextField, height: 2.2),
        ),
        SizedBox(height: 8),
        CustomTextField(
          // controller: cubit.codeController,
          keyboardType: TextInputType.number,
        ),

        CustomAuthBttn(
          onPressed: () {
            cubit.printregister();
          },
          bttnText: "التسجيل",
        ),

        CustomTextButtomAuth(
          one: "لديك حساب مسبقاً ؟  ",
          tow: "نعم",
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.loginPage);
          },
        ),
      ],
    );
  }
}

class CheckStudentInfo extends StatelessWidget {
  final RegisterCubit cubit;
  const CheckStudentInfo({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "الطالب /ة: ",
              style: Styles.meduimWhite.copyWith(color: AppColor.black1),
            ),
            Text(
              "${cubit.firstNameController.text} ${cubit.lastNameController.text}",
              style: Styles.largeWhite.copyWith(color: AppColor.primaryColor),
            ),
          ],
        ),
        Text(
          "الصف : الثالث الثانوي / علمي",
          style: Styles.meduimWhite.copyWith(color: AppColor.black1),
        ),
        SizedBox(height: 20),
        Text(
          "لقد تم تأكيد هويتك بنجاح ",
          style: Styles.meduimWhite.copyWith(color: AppColor.black1),
        ),
        Text(
          " قم بتعيين كلمة مرور من أجل حماية حسابك ",
          style: TextStyle(color: AppColor.borderTextField, height: 2.2),
        ),
      ],
    );
  }
}

class PassWordForm extends StatelessWidget {
  final RegisterCubit cubit;
  const PassWordForm({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          baseText: "كلمة المرور :",
          isPassword: true,
          passToggle: true,
          // controller: cubit.passWordController,
          keyboardType: TextInputType.text,
          icon: Icons.lock_outline,
        ),

        CustomTextField(
          baseText: "تأكيد كلمة المرور",
          isPassword: true,
          passToggle: true,
          // controller: cubit.rePassWordController,
          keyboardType: TextInputType.text,
          icon: Icons.lock_outline,
        ),
      ],
    );
  }
}
