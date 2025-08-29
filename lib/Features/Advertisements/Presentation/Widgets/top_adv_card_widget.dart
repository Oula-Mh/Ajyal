import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Custom/Custom_widgets/cache_image_widget.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/teacher_adv/teacher_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/home_adv_widget/adv_title_widget.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/teacher_adv_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TeacherAdvListView extends StatelessWidget {
  const TeacherAdvListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherAdvCubit, TeacherAdvState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "مدرسو المركز :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  state is TeacherAdvSuccess
                      ? ViewAllAdv(
                        router: AppRouter.allTeacherPage,
                        params: {'resultsList': state.model.data},
                        viewText: "عرض الكل",
                      )
                      : SizedBox(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child:
                  state is TeacherAdvSuccess
                      ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.model.data!.length,
                        itemBuilder: (context, index) {
                          final item = state.model.data![index];
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                AppRouter.teacherInfoPage,
                                extra: item.advertisableId,
                              );
                            },
                            child: Container(
                              width: 135,
                              margin: const EdgeInsets.only(
                                left: 15,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  CacheImage(
                                    imageUrl:
                                        EndPoints.fileBaseUrl +
                                        item.images![0].path!,
                                    width: 150,
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    isStringExist: true,
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Card(
                                      elevation: 5,
                                      color: AppColor.secondaryColor
                                          .withOpacity(.80),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        child: Text(
                                          item.title!,
                                          style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                      : TeacherAdvListSkeleton(),
            ),
          ],
        );
      },
    );
  }
}
