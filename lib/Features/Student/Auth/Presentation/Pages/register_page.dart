import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Custom/Custom_ui.dart/gradient_background_widget.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_text_field.dart';
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
              SizedBox(height: 55),
              Text(" أهلاً وسهلاً .. !", style: Styles.largeWhite),
              SizedBox(height: 10),
              Text("تسجيل حساب جديد ", style: Styles.meduimGray),
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
                    child: BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        final cubit = RegisterCubit.get(context);
                        if (state is RegisterCheckSuccess) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                CheckStudentInfo(cubit: cubit),
                                SizedBox(height: 30),
                                PassWordForm(cubit: cubit),
                                SizedBox(height: 50),
                                CustomAuthBttn(
                                  onPressed: () {},
                                  bttnText: "تأكيد",
                                ),
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
        Text("الاسم الأول : ", style: Styles.meduimBlack),
        SizedBox(height: 8),
        CustomTextField(
          isPassword: false,
          controller: cubit.firstNameController,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 31),
        Text("الاسم الثاني : ", style: Styles.meduimBlack),
        SizedBox(height: 8),
        CustomTextField(
          isPassword: false,
          controller: cubit.lastNameController,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 31),
        Text("الكود الخاص بالطالب : ", style: Styles.meduimBlack),
        Text(
          " * لا تشارك الكود الخاص بك مع الآخرين  ",
          style: TextStyle(color: AppColor.borderTextField, height: 2.2),
        ),
        SizedBox(height: 8),
        CustomTextField(
          controller: cubit.codeController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 50),
        CustomAuthBttn(
          onPressed: () {
            cubit.printregister();
          },
          bttnText: "التسجيل",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("لديك حساب مسبقاً ؟"),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.loginPage);
              },
              child: Text(
                "نعم",
                style: TextStyle(color: AppColor.primaryColor),
              ),
            ),
          ],
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
        Text("كلمة المرور : ", style: Styles.meduimBlack),
        SizedBox(height: 8),
        CustomTextField(
          isPassword: true,
          passToggle: true,
          controller: cubit.passWordController,
          keyboardType: TextInputType.text,
          icon: Icons.lock_outline,
        ),
        SizedBox(height: 31),
        Text("تأكيد كلمة المرور : ", style: Styles.meduimBlack),
        SizedBox(height: 8),
        CustomTextField(
          isPassword: true,
          passToggle: true,
          controller: cubit.rePassWordController,
          keyboardType: TextInputType.text,
          icon: Icons.lock_outline,
        ),
      ],
    );
  }
}
