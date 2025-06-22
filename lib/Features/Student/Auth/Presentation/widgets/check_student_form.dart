import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_field.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckStudentForm extends StatelessWidget {
  final RegisterCubit cubit;
  final RegisterState state;
  const CheckStudentForm({super.key, required this.cubit, required this.state});

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
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 50),
        state is RegisterCheckLoading
            ? Center(child: CircularProgressIndicator())
            : CustomAuthBttn(
              onPressed: () {
                cubit.checkStudent();
                // cubit.printregister();
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
