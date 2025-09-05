import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_adv/course_adv_cubit.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/all_course_item.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/top_pagenation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatelessWidget {
  final List<AdvModel> resultsList;
  final AdvPaginationModel paginationModel;
  const TestPage({
    super.key,
    required this.resultsList,
    required this.paginationModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseAdvCubit, CourseAdvState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.white1,
          appBar: customAppBar(context, "الدورات المتاحة"),
          bottomNavigationBar: BlocListener<CourseAdvCubit, CourseAdvState>(
            listener: (context, state) {
              if (state is CourseAdvSuccess) {}
            },
            child: ResponsivePaginationBar(
              paginationModel: paginationModel,
              onPageChanged: (int page) {
                context.read<CourseAdvCubit>().getCourseAdv(page: page);
              },
            ),
          ),

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, right: 30),
                child: Text(
                  "يوجد ${paginationModel.total} إعلان",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              state is AdvLoading
                  ? Center(child: CircularProgressIndicator())
                  : state is CourseAdvSuccess
                  ? Expanded(
                    child: AllCourseItem(
                      itemCount: state.model.data!.length,
                      courses: state.model.data!,
                      isGeneral: false,
                      isCourse: true,
                    ),
                  )
                  : state is AdvFailure
                  ? Center(child: Text(state.errMssg))
                  : Center(child: Text("UnKnown State")),
            ],
          ),
        );
      },
    );
  }
}
