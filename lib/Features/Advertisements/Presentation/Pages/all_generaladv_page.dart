import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/general_adv/general_adv_cubit.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/all_course_item.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/top_pagenation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllGeneraladvPage extends StatelessWidget {
  final List<AdvModel> resultsList;
  final AdvPaginationModel paginationModel;
  const AllGeneraladvPage({
    super.key,
    required this.resultsList,
    required this.paginationModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralAdvCubit, GeneralAdvState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.white1,
          appBar: customAppBar(context, "إعلانات عامة"),
          bottomNavigationBar: BlocListener<GeneralAdvCubit, GeneralAdvState>(
            listener: (context, state) {
              if (state is GeneralAdvSuccess) {}
            },
            child: ResponsivePaginationBar(
              paginationModel: paginationModel,
              onPageChanged: (int page) {
                context.read<GeneralAdvCubit>().getGeneralAdv(page: page);
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
              state is GeneralAdvLoading
                  ? Center(child: CircularProgressIndicator())
                  : state is GeneralAdvSuccess
                  ? Expanded(
                    child: AllCourseItem(
                      itemCount: state.model.data!.length,
                      courses: state.model.data!,
                      isGeneral: true,
                      isCourse: false,
                    ),
                  )
                  : state is GeneralAdvFailure
                  ? Center(child: Text(state.errMssg))
                  : Center(child: Text("UnKnown State")),
            ],
          ),
        );
      },
    );
  }
}
