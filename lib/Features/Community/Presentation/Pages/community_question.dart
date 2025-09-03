import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Features/Subjects/Data/model/subject_model.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CommunityQuestionPage extends StatelessWidget {
  final List<String> subjects = [
    "عربي",
    "علوم",
    "رياضيات",
    "إنكليزي",
    "كيمياء",
    "فيزياء",
    "إسلامية",
  ];

  CommunityQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" أسئلة الطلاب", style: Styles.largeWhite),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.purple.withAlpha(80),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "   اختر المادة للانضمام إلى مساحة النقاش وطرح الأسئلة كما يمكنك الاطلاع على الأسئلة المتكررة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  height: 1.8,
                  color: AppColor.primaryColor,
                ),
              ),
            ),

            SizedBox(height: 20),

            /// GridView للمواد
            BlocBuilder<SubjectCubit, SubjectState>(
              builder: (context, subjectState) {
                if (subjectState is SubjectLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (subjectState is SubjectLoadedSuccess) {
                  return CustomSubjectWidget(subjects: subjectState.subjects);
                } else if (subjectState is SubjectError) {
                  return Center(child: Text("فشل تحميل المواد"));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSubjectWidget extends StatelessWidget {
  final List<SubjectModel> subjects;
  const CustomSubjectWidget({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: subjects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // قسمين
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.5, // للتحكم بشكل الـ Container
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(
                context,
              ).push(AppRouter.allQuestionPage, extra: subjects[index].id);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border(
                  bottom: BorderSide(
                    color: AppColor.primaryColor.withAlpha(100),
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                subjects[index].name!,
                style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
