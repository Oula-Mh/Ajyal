import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/utils/Function/validation.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Custom/Custom_ui.dart/gradient_background_widget.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_auth_bttn.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_container_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_buttom_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_field.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_header_auth.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<LoginParentCubit, LoginParentState>(
      listener: (context, state) {
        if (state is LoginParentSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("تم تسجيل الدخول بنجاح")));
          getit<CacheHelper>().saveData(key: "role", value: "Parent");
          GoRouter.of(context).go(AppRouter.selectStudentLogin);
        } else if (state is LoginParentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("فشل تسجيل الدخول: ${state.errMessage}")),
          );
        }
      },
      builder: (context, state) {
        final cubit = LoginParentCubit.get(context);
        return Form(
          key: cubit.formKeyLogin,
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                baseText: "رقم الهاتف :",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: cubit.phone,
                hint: "ادخل رقم هاتفك",
                validator: (val) {
                  // return validInput(val!, 9, 10, "phone");
                },
              ),

              CustomTextField(
                baseText: "كلمة المرور :",
                icon: Icons.lock_outline,
                keyboardType: TextInputType.text,
                controller: cubit.password,
                hint: "ادخل كلمة المرور",
                isPassword: true,
                passToggle: true,
                validator: (val) {
                  return validInput(val!, 8, 100, "password");
                },
              ),
              state is LoginParentLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustomAuthBttn(
                    onPressed: () {
                      cubit.login();
                    },
                    bttnText: 'الدخول',
                  ),

              CustomTextButtomAuth(
                one: "ليس لديك حساب ؟  ",
                tow: "إنشاء حساب",
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.parentRgister);
                },
              ),
            ],
          )),
        );
      },
    );
  }
}
