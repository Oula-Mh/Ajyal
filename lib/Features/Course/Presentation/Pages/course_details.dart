import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/custom_subject_list.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/enroll_widget.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/subcourse_details2.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/subcourse_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsPage extends StatelessWidget {
  List<Images>? images;
  CourseDetailsPage({super.key, @required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white1,
      appBar: customAppBar(context, "تفاصيل الكورس"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: BlocBuilder<CourseCubit, CourseState>(
            builder: (context, state) {
              return state is GetDetailsSuccess
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //ImageSlider(imageUrls: images!),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.secondaryColor.withAlpha(130),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Text(
                          "اسم الكورس : \n${state.model.name!}",
                          style: TextStyle(
                            fontSize: 21,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SubCourseDetails(
                        type: state.model.type!,
                        cost: state.model.cost!,
                      ),
                      SizedBox(height: 10),
                      SubcourseDetails2(
                        start: state.model.startDate!,
                        end: state.model.endDate!,
                        capacity: state.model.capacity.toString(),
                      ),
                      SizedBox(height: 28),
                      Text(
                        "المواد ضمن الكورس :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      ...List.generate(
                        state.model.curriculums!.length,
                        (index) => CustomSubjectList(
                          model: state.model.curriculums![index],
                        ),
                      ),
                      SizedBox(height: 70),
                      EnrollBttn(),
                    ],
                  )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
