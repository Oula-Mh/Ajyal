import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_Adv/course_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/home_adv_widget/adv_title_widget.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/home_adv_widget/general_adv_list.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/noti_profile_header.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/top_info_card.dart';
import 'package:ajyal/Features/Home/Presentation/Widgets/course_adv_list.dart';
import 'package:ajyal/Features/Home/Presentation/Widgets/course_adv_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAdvPage extends StatelessWidget {
  const HomeAdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF365EB1), Color(0xFF17284B)],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                HeaderRow(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height / 1.38,
                    decoration: BoxDecoration(
                      color: AppColor.white1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            GeneralAdvList(),
                            SizedBox(height: 10),
                            BlocBuilder<CourseAdvCubit, CourseAdvState>(
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الكورسات المتاحة",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        if (state is CourseAdvSuccess)
                                          ViewAllAdv(
                                            router: AppRouter.test,
                                            params: {
                                              'resultsList': state.model.data,
                                              'paginationModel': state.model,
                                            },
                                            viewText: "عرض الكل",
                                          ),
                                      ],
                                    ),
                                    state is CourseAdvSuccess
                                        ? CourseAdvListView(
                                          mylist: state.model.data!,
                                        )
                                        : SizedBox(
                                          height: 260,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 2,
                                            itemBuilder: (context, index) {
                                              return const CourseAdvShimmer();
                                            },
                                          ),
                                        ),
                                  ],
                                );
                              },
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
        Positioned(
          top: 78,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: TopInfoCard(),
          ),
        ),
      ],
    );
  }
}
