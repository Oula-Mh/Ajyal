import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/teacher_adv_page.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/teache_subject_widget.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repoimp.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottonTeacherPart extends StatelessWidget {
  final double containerHeight;
  final double screenHeight;
  const BottonTeacherPart({
    super.key,
    required this.containerHeight,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: containerHeight - 160,
      child: ClipPath(
        clipper: SlantedClipper(),
        child: Container(
          decoration: BoxDecoration(color: AppColor.primaryColor),
          width: MediaQuery.of(context).size.width,
          height: screenHeight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 120,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return state is TeacherProfileSuccess
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.secondaryColor.withOpacity(0.6),
                                blurRadius: 4,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            "المعلومات الشخصية",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          state.model.bio!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white60,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 25),
                        getit<TokenHandler>().hasToken(
                              TokenHandler.studentTokenKey,
                            )
                            ? Text(
                              "المواد التي يدرسها : ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            )
                            : Container(),
                        SizedBox(height: 13),
                        getit<TokenHandler>().hasToken(
                              TokenHandler.studentTokenKey,
                            )
                            ? BlocProvider(
                              create:
                                  (context) => SubjectCubit(
                                    SubjectRepoimp(DioConsumer(Dio())),
                                  ),
                              child: Builder(
                                builder: (context) {
                                  // في شوية تأخير هون لسبب انو بدي استعدي ال cubit كامل بعدها استخدمه
                                  final cubit = BlocProvider.of<SubjectCubit>(
                                    context,
                                  );
                                  cubit.subjectForTeacher(state.model.id!);
                                  return TeacherSubject();
                                },
                              ),
                            )
                            : Container(),
                      ],
                    )
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
