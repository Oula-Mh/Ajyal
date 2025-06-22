// import 'package:ajyal/Core/routes/app_router.dart';
// import 'package:ajyal/Core/styles/app_color.dart';
// import 'package:ajyal/Core/styles/app_text_style.dart';
// import 'package:ajyal/Custom/Custom_ui.dart/gradient_background_widget.dart';
// import 'package:ajyal/Custom/Custom_widgets/custom_auth_bttn.dart';
// import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/register/register_cubit.dart';
// import 'package:ajyal/Features/Student/Auth/Presentation/widgets/check_student_form.dart';
// import 'package:ajyal/Features/Student/Auth/Presentation/widgets/check_student_info.dart';
// import 'package:ajyal/Features/Student/Auth/Presentation/widgets/password_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: GradientBackgroundWidget(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 55),
//               Text(" أهلاً وسهلاً .. !", style: Styles.largeWhite),
//               SizedBox(height: 10),
//               Text("تسجيل حساب جديد ", style: Styles.meduimGray),
//               SizedBox(height: 24),
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: AppColor.white1,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 26,
//                       right: 26,
//                       top: 50,
//                       bottom: 10,
//                     ),
//                     child: BlocConsumer<RegisterCubit, RegisterState>(
//                       builder: (context, state) {
//                         final cubit = RegisterCubit.get(context);
//                         if (state is RegisterCheckSuccess) {
//                           var model = state.model;
//                           return SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 CheckStudentInfo(model: model),
//                                 SizedBox(height: 30),
//                                 PassWordForm(cubit: cubit),
//                                 SizedBox(height: 50),
//                                 state is RegisterLoading
//                                     ? Center(child: CircularProgressIndicator())
//                                     : CustomAuthBttn(
//                                       onPressed: () {
//                                         print("object");
//                                         cubit.register(
//                                           model.data!.userId.toString(),
//                                           model.data!.accessCode.toString(),
//                                         );
//                                       },
//                                       bttnText: "تأكيد التسجيل",
//                                     ),
//                               ],
//                             ),
//                           );
//                         }
//                         return SingleChildScrollView(
//                           child: CheckStudentForm(cubit: cubit, state: state),
//                         );
//                       },
//                       listener: (BuildContext context, RegisterState state) {
//                         if (state is RegisterCheckFail) {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 content: Text(state.errMessage),
//                                 actions: [
//                                   TextButton(
//                                     child: Text("OK"),
//                                     onPressed: () {
//                                       // Do something
//                                       Navigator.of(context).pop();
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         } else if (state is RegisterSuccess) {
//                           GoRouter.of(
//                             context,
//                           ).pushReplacement(AppRouter.homePage);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
