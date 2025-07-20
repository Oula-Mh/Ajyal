import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/teacher_adv_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/custom_info_row.dart';
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
      top: containerHeight - 110,
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

                        // Text(
                        //   "fs",
                        //   style: TextStyle(
                        //     fontSize: 18,
                        //     color: Colors.white60,
                        //     height: 1.7,
                        //   ),
                        // ),
                        CustomRowInfo(
                          title: "الايميل للتواصل : ",
                          info: "${state.model.email}",
                        ),
                        CustomRowInfo(
                          title: "رقم الهاتف : ",
                          info: "${state.model.phoneNumber}",
                        ),
                        CustomRowInfo(
                          title: "تاريخ الانضمام إلى المعهد : ",
                          info: "${state.model.dateOfContract}",
                        ),
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
