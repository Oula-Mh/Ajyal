import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Custom/Custom_ui.dart/gradient_background_widget.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_auth_bttn.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/check_student_info_model.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/widgets/check_student_info.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/widgets/password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompleteRegisterPage extends StatelessWidget {
  final CheckStudentInfoModel model;
  const CompleteRegisterPage({super.key, required this.model});

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
                    child: BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterFail) {
                          customAlert(context, state.errMessage, () {
                            Navigator.of(context).pop();
                          });
                        } else if (state is RegisterSuccess) {
                          getit<CacheHelper>().saveData(
                            key: "role",
                            value: "Student",
                          );
                          GoRouter.of(
                            context,
                          ).pushReplacement(AppRouter.configPage);
                          GoRouter.of(
                            context,
                          ).pushReplacement(AppRouter.configPage);
                        }
                      },
                      builder: (context, state) {
                        final cubit = RegisterCubit.get(context);
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              CheckStudentInfo(model: model),
                              SizedBox(height: 30),
                              PassWordForm(cubit: cubit),
                              SizedBox(height: 50),
                              state is RegisterLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : CustomAuthBttn(
                                    onPressed: () {
                                      cubit.register(
                                        model.data!.userId.toString(),
                                        model.data!.accessCode.toString(),
                                      );
                                    },
                                    bttnText: "تأكيد التسجيل",
                                  ),
                            ],
                          ),
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
