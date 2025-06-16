import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Custom/Custom_ui.dart/gradient_background_widget.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_auth_bttn.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Widgets/text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: GradientBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "أهلاً و سهلاً .. !",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "تسجيل حساب جديد",
                      style: TextStyle(fontSize: 17, color: Color(0xFFAC9F9F)),
                    ),
                  ],
                ),
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
                      padding: EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 30,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormFieldAuth(
                              baseText: 'اسم المستخدم :',
                              isNumber: false,
                              hintText: "ادخل اسمك",
                              iconData: Icons.person,
                              isPassword: false,
                              passToggle: false,
                              // validator: (val) {
                              //   return validInput(val!, 10, 10, "phone");
                              // }
                              // mycontroller: context.read<LoginCubit>().phone,
                            ),

                            TextFormFieldAuth(
                              baseText: 'رقم الهاتف :',
                              isNumber: true,
                              hintText: "ادخل رقم هاتفك",
                              iconData: Icons.phone,
                              isPassword: false,
                              passToggle: false,
                              // validator: (val) {
                              //   return validInput(val!, 10, 10, "phone");
                              // }
                              // mycontroller: context.read<LoginCubit>().phone,
                            ),

                            TextFormFieldAuth(
                              baseText: 'كلمة المرور :',
                              isNumber: false,
                              hintText: "ادخل كلمة المرور",
                              iconData: Icons.lock,
                              isPassword: true,
                              passToggle: true,
                              // validator: (val) {
                              //   return validInput(val!, 10, 10, "phone");
                              // }
                              // mycontroller: context.read<LoginCubit>().phone,
                            ),

                            TextFormFieldAuth(
                              baseText: 'تأكيد كلمة المرور :',
                              isNumber: true,
                              hintText: "أكد كلمة المرور",
                              iconData: Icons.lock,
                              isPassword: true,
                              passToggle: true,
                              // validator: (val) {
                              //   return validInput(val!, 10, 10, "phone");
                              // }
                              // mycontroller: context.read<LoginCubit>().phone,
                            ),
                            CustomAuthBttn(
                              onPressed: () {
                                GoRouter.of(
                                  context,
                                ).push(AppRouter.qrScannerPage);
                              },
                              bttnText: 'التالي',
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("هل لديك حساب ؟ "),
                                GestureDetector(
                                  child: Text(
                                    'تسجيل الدخول',
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onTap: () {
                                    GoRouter.of(
                                      context,
                                    ).pushReplacement(AppRouter.parentLogin);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
