import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/adv/adv_cubit.dart';
import 'package:ajyal/Features/Home/Presentation/Widgets/course_adv_list.dart';
import 'package:ajyal/Features/Home/Presentation/Widgets/course_adv_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeAdvPage extends StatelessWidget {
  const HomeAdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF365EB1), Color(0xFF17284B)],
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.sizeOf(context).height / 1.25,
          decoration: BoxDecoration(
            color: AppColor.white1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocConsumer<AdvCubit, AdvState>(
              listener: (context, state) {
                if (state is CourseAdvSuccess) {}
              },
              builder: (context, state) {
                return Column(
                  children: [
                    // SizedBox(height: 50),
                    // Text("صفحة الإعلانات", style: Styles.meduimBlack),
                    // SizedBox(height: 50),
                    MaterialButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.rolePage);
                      },
                      color: AppColor.primaryColor,
                      child: Text("تسجيل الدحول", style: Styles.meduimWhite),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الدورات المتاحة ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          state is CourseAdvSuccess
                              ? TextButton(
                                onPressed: () {
                                  GoRouter.of(context).push(
                                    AppRouter.allCoursePage,
                                    extra: {
                                      'resultsList': state.model.data,
                                      'paginationModel': state.model,
                                    },
                                  );
                                },
                                child: Text(
                                  "عرض الكل",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    state is CourseAdvSuccess
                        ? CourseAdvListView(mylist: state.model.data!)
                        : SizedBox(
                          height: 290,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2, // Show 2 shimmer items
                            itemBuilder: (context, index) {
                              return const CourseAdvShimmer();
                            },
                          ),
                        ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
