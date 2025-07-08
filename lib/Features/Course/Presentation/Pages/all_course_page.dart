import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/all_course_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/adv/adv_cubit.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/top_pagenation_widget.dart';

class AllCoursePage extends StatelessWidget {
  final List<CourseAdvModel> resultsList;
  final AdvPaginationModel paginationModel;
  const AllCoursePage({
    super.key,
    required this.resultsList,
    required this.paginationModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvCubit, AdvState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.white1,
          appBar: customAppBar(context, "الدورات المتاحة"),
          bottomNavigationBar: BlocListener<AdvCubit, AdvState>(
            listener: (context, state) {
              if (state is CourseAdvSuccess) {}
            },
            child: ResponsivePaginationBar(
              paginationModel: paginationModel,
              onPageChanged: (int page) {
                context.read<AdvCubit>().getCourseAdv(page: page);
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
                  ? Expanded(child: AllCourseItem(state: state))
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
